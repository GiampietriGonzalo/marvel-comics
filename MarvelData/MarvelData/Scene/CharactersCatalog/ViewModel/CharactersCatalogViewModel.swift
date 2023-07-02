//
//  CharactersCatalogViewModel.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

@MainActor
final class CharactersCatalogViewModel: ObservableObject {
    @Published private(set) var characters: [CharacterModel] = []
    private let repository = CharactersRepository()
    
    func loadCatalog() async {
        let fetched = await repository.fetch()
        characters = fetched
    }
}
