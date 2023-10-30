//
//  AlbumSearchView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 30.10.2023.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceHolderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

struct AlbumPlaceHolderView: View {
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "cry to me", "maneskin"]
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button(action: {
                    searchTerm = text
                }, label: {
                    Text(text)
                        .font(.title2)
                })
            }
        }
    }
}
