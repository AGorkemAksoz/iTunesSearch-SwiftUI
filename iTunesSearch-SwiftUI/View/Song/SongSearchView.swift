//
//  SongSearchView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 4.01.2024.
//

import SwiftUI

struct SongSearchView: View {
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    SongPlaceHolderView(searchTerm: $viewModel.searchTerm)
                } else {
                    SongListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }

}

struct SongPlaceHolderView: View {
    
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
