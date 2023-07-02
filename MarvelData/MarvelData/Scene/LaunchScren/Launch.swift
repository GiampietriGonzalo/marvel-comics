//
//  Launch.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 18/06/2023.
//

import SwiftUI

struct Launch: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                LogoImageView()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    Launch()
}
