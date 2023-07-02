//
//  CharacterInformationView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 02/07/2023.
//

import SwiftUI

struct CharacterInformationView: View {
    @StateObject var character: CharacterModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode:  .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(minHeight: 200)
            
            HStack {
                Text(character.name)
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                Spacer()
            }
            
            HStack {
                Text(character.description)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                Spacer()
            }
        }
    }
}

#Preview {
    CharacterInformationView(character: mockCharacter)
}
