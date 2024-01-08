//
//  SearchView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 28.12.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedEntityType = EntityType.all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                if searchTerm.count == 0 {
                    SearchPlaceHolderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity )
                } else {
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel,
                                          songListViewModel: songListViewModel,
                                          moviewListViewModel: movieListViewModel)
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                    case .song:
                        EmptyView()
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                    }
                }
                
                Spacer()
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
        .onChange(of: searchTerm, perform: { value in
            albumListViewModel.searchTerm = value
            songListViewModel.searchTerm = value
            movieListViewModel.searchTerm = value
        })
    }
}
