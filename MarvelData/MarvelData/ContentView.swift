//
//  ContentView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 17/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharactersCatalogViewModel()
   
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    List {
                        ForEach(viewModel.characters.shuffled()) { character in
                            CharacterPreviewView(character: character)
                                .frame(minWidth: .zero, minHeight: 200)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .navigationTitle("Marvel Characters")
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.loadCatalog()
                    }
                }
            }
        }
        .task {
            await viewModel.loadCatalog()
        }
    }
    
}

#Preview {
    ContentView()
}
