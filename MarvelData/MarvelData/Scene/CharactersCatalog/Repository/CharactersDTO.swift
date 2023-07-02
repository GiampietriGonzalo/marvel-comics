//
//  CharactersDTO.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import Foundation

// MARK: - CharactersInformationDTO
struct CharactersInformationDTO: Codable {
    let etag: String
    let data: CharactersDataDTO
}

// MARK: - DataClass
struct CharactersDataDTO: Codable {
    let results: [CharacterDTO]
}

// MARK: - Result
struct CharacterDTO: Codable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
    let comics: Comics
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
