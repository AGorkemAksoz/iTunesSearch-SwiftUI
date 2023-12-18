//
//  AlbumListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel : MovieListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movie, id: \.trackID) { movie in
                    Text(movie.trackName ?? "Unknown Album")
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
        }
    }
}
