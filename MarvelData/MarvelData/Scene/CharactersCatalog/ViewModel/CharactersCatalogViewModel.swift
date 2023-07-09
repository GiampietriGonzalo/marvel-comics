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
    private var imageStorage: Storage<Data>?
    private var characterStorage: Storage<[CharacterModel]>?
    
    init() {
        self.imageStorage = .init()
        self.characterStorage = .init()
    }
    
    @MainActor func loadCatalog() async {
        isLoading = true
        if let charactersFromStorage = await characterStorage?.retrieve(for: "characters") {
            self.characters = charactersFromStorage
            isLoading = false
        } else {
            let fetched = await repository.fetch()
            characters = fetched
            await characterStorage?.store(characters, for: "characters")
            isLoading = false
        }
    }
    
    @MainActor func getImage(for character: CharacterModel) async throws -> Image {
        guard let imageFromStorage = await imageStorage?.retrieve(for: character.thumbnail) else {
            let imageData = try await repository.downloadImage(url: character.thumbnail)
            await imageStorage?.store(imageData, for: character.thumbnail)
            return try getImage(from: imageData)
        }
        
        return try getImage(from: imageFromStorage)
    }
    
    private func getImage(from data: Data) throws -> Image {
        if let image = Image(data: data) { return image }
        else { throw NetworkError.unknown }
    }
}
