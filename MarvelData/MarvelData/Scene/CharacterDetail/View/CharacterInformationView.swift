//
//  CharacterInformationView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 02/07/2023.
//

import SwiftUI

struct CharacterInformationView: View {
    @ObservedObject private(set) var character: CharacterModel
    @ObservedObject private(set) var viewModel: CharactersCatalogViewModel
    @State var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minHeight: 200)
            
            HStack {
                Text(character.name)
                    .font(.title)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                Spacer()
            }
            
            HStack {
                Text(character.description)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                Spacer()
            }
        }
        .task {
            do {
                self.image = try await viewModel.getImage(for: character)
            } catch {
                
            }
        }
    }
}

#Preview {
    CharacterInformationView(character: mockCharacter, viewModel: CharactersCatalogViewModel())
}
