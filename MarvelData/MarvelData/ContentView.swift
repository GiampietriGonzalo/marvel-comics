//
//  ContentView.swift
//  MarvelData
//
//  Created by Gonzalo.Giampietri on 17/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharactersCatalogViewModel()
    @State var didEndFirstLoad = false
   
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if viewModel.isLoading, !didEndFirstLoad {
                        ProgressView().onDisappear(perform: {
                            self.didEndFirstLoad = true
                        })
                    } else {
                        List {
                            ForEach(viewModel.characters.shuffled()) { character in
                                CharacterPreviewView(character: character, viewModel: viewModel)
                                    .frame(minWidth: .zero, minHeight: 200)
                                    .listRowSeparator(.hidden)
                                    .overlay {
                                        NavigationLink(destination: CharacterDetailView(character: character, viewModel: viewModel)) {}
                                            .opacity(0)
                                    }
                            }
                        }
                        .listStyle(.plain)
                        .scrollIndicators(.hidden)
                        .refreshable {
                            await viewModel.loadCatalog()
                        }
                    }
                }
                .navigationTitle("Marvel Characters")
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
