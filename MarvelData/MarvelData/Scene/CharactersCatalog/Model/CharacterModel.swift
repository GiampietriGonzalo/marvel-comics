//
//  CharacterModel.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import SwiftUI

final class CharacterModel: ObservableObject {
    
    let id: Int
    let name, description: String
    let thumbnail: String
    let comics: ComicModel
    
    init(from dto: CharacterDTO) {
        self.id = dto.id
        self.name = dto.name
        self.description = dto.description
        self.thumbnail = dto.thumbnail.path + "." + dto.thumbnail.thumbnailExtension
        self.comics = ComicModel(from: dto.comics)
    }
    
    static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension CharacterModel: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
