//
//  CharactersCatalogViewModel.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

final class CharactersCatalogViewModel: ObservableObject {
    @MainActor @Published private(set) var characters: [CharacterModel] = []
    @Published private(set) var isLoading = false
    private let repository = CharactersRepository()
    private var imageStorage: Storage<MarvelImage>?
    private var characterStorage: Storage<[CharacterModel]>?
    
    init() {
        self.imageStorage = .init()
        self.characterStorage = .init()
    }
    
    @MainActor func loadCatalog() async throws {
        isLoading = true
        if let charactersFromStorage = await characterStorage?.retrieve(for: "characters") {
            self.characters = charactersFromStorage
            isLoading = false
        } else {
            let fetched = await repository.fetch()
            characters = fetched
            await characterStorage?.store(characters, for: "characters")
            try await fetchImages(for: Array(fetched.prefix(20))) //Fetchs the first 20 images
            Task { try await fetchImages(for: Array(fetched.suffix(from: 19)))  } //Fetchs the rest of the images without blocking the current task scope
            isLoading = false
        }
    }
    
    @MainActor func getImage(for character: CharacterModel) async throws -> Image {
        guard let imageFromStorage = await imageStorage?.retrieve(for: character.thumbnail) else {
            let imageData = try await repository.downloadImage(url: character.thumbnail)
            await imageStorage?.store(MarvelImage(data: imageData), for: character.thumbnail)
            return try getImage(from: imageData)
        }
        
        return try getImage(from: imageFromStorage.data)
    }
    
    private func fetchImages(for characters: [CharacterModel]) async throws {
        await withThrowingTaskGroup(of: MarvelImage.self) { group in
            for character in characters {
                group.addTask {
                    let imageData = try await self.fetchImage(from: character.thumbnail)
                    return MarvelImage(data: imageData)
                }
            }
        }
    }
    
    private func fetchImage(from url: String) async throws -> Data {
        let imageData = try await repository.downloadImage(url: url)
        await imageStorage?.store(MarvelImage(data: imageData), for: url)
        return imageData
    }
    
    private func getImage(from data: Data) throws -> Image {
        if let image = Image(data: data) { return image }
        else { throw NetworkError.unknown }
    }
}
