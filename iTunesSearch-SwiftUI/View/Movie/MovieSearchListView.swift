//
//  MovieListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import SwiftUI

struct MovieSearchListView: View {
    @StateObject private var viewModel: MovieListViewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    MoviePlaceHolderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}


struct MoviePlaceHolderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Lord Of The Rings", "Before Sunrise", "Matrix"]
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
