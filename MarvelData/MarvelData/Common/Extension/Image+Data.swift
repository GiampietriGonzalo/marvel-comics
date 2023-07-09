//
//  Image+Data.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 03/07/2023.
//

import SwiftUI

extension Image {
    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else {
           return nil
        }
        
        self.init(uiImage: uiImage)
    }
}
