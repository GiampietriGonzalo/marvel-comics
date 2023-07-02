//
//  CharacterPreviewView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

struct CharacterPreviewView: View {
    @StateObject var character: CharacterModel
    
    var body: some View {
        CharacterInformationView(character: character)
            .background(.thinMaterial)
            .mask(RoundedRectangle(cornerRadius: 16))
            .padding(.bottom, 8)
    }
}

let mockCharacter = CharacterModel(from: CharacterDTO(id: 0, name: "Rock Man", description: "A big blue guy that seems to be rock. It seems to be friendly", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: "jpg"), comics: Comics(available: 0, collectionURI: "", items: [], returned: 0)))

#Preview {
    CharacterPreviewView(character: mockCharacter)
}
