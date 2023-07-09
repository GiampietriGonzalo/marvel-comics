//
//  ImageStorage.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 08/07/2023.
//

import SwiftUI

actor Storage<T: Hashable> {
    
    private var dictionary = [String: T]()
    
    func store(_ element: T, for key: String) {
        dictionary[key] = element
    }
    
    func retrieve(for key: String) -> T? {
        dictionary[key]
    }
}
