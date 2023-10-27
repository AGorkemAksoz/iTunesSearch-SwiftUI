//
//  AlbumListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 26.10.2023.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.albums, id: \.id) { album in
                    Text(album.collectionName ?? "Unknown Album")
                }
                
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear(perform: {
                            viewModel.loadMore()
                        })
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                case .loadedAll:
                    Color.gray
                case .error(let string):
                    Text(string)
                        .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

struct AlbumPlaceHolderView: View {
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "cry to me", "maneskin"]
    var body: some View {
        VStack {
            ForEach(suggestions, id: \.self) { text in
                Button(action: {
                    searchTerm = text
                }, label: {
                    Text(text)
                })
            }
        }
    }
}

