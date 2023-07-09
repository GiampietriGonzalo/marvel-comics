//
//  Errors.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 03/07/2023.
//

enum NetworkError: Error {
    case invalidURL
    case parseError
    case networkError
    case unknown
}
