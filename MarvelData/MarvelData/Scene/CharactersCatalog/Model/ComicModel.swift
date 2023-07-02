//
//  ComicModel.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

struct ComicModel {
    let collectionURI: String
    let items: [ComicItemModel]
    
    init(from dto: Comics) {
        self.collectionURI = dto.collectionURI
        self.items = dto.items.compactMap({ ComicItemModel(from: $0) })
    }
}

struct ComicItemModel {
    let resourceURI: String
    let name: String
    
    init(from dto: ComicsItem) {
        self.resourceURI = dto.resourceURI
        self.name = dto.name
    }
}
