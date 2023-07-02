//
//  CharacterDetailView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject private(set) var character: CharacterModel
    
    var body: some View {
        VStack {
            CharacterInformationView(character: character)
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    CharacterDetailView(character: mockCharacter)
}
