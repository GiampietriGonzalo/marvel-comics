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
            Text("Hello, World!")
                
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    CharacterDetailView(character: mockCharacter)
}
