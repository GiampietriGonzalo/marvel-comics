//
//  CharacterDetailView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject private(set) var character: CharacterModel
    @ObservedObject private(set) var viewModel: CharactersCatalogViewModel
    
    var body: some View {
        VStack {
            CharacterInformationView(character: character, viewModel: viewModel)
            Spacer()
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    CharacterDetailView(character: mockCharacter, viewModel: CharactersCatalogViewModel())
}
