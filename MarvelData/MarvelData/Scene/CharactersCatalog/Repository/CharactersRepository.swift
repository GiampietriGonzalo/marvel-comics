//
//  CharactersRepository.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 01/07/2023.
//

import Foundation

final class CharactersRepository {
    
    func fetch() async -> [CharacterModel] {
        guard let url = buildUrl() else { return [] }
        var result = [CharacterModel]()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let charactersDTO = try JSONDecoder().decode(CharactersInformationDTO.self, from: data)
            result = charactersDTO.data.results.compactMap({ CharacterModel(from: $0) })
        } catch {
            print("something went wrong")
        }
        
        return result
    }
    
    func downloadImage(url: String) async throws -> Data {
        guard let url = URL(string: url) else { throw  NetworkError.invalidURL }
        var result: Data
        do {
            (result, _) = try await URLSession.shared.data(from: url)
        } catch {
            throw NetworkError.networkError
        }
        
        return result
    }
    
    private func buildUrl() -> URL? {
        let constants = CharactersRepositoryConstants()
        let urlString = "\(constants.endpoint)?limit=100&offset=300&apikey=\(constants.key)&hash=\(constants.hash)&ts=\(constants.ts)"
        return URL(string: urlString)
    }
}

struct CharactersRepositoryConstants {
    let endpoint = "https://gateway.marvel.com/v1/public/characters"
    let key = "4fc107606f79aa527ca7de374ccd229d"
    let hash = "f4d942cffc54ad1aef8a2c23e564115e"
    let ts = "7"
}
