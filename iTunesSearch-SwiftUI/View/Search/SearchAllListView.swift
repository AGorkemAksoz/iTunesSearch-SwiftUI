//
//  SearchAllListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 3.01.2024.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var moviewListViewModel: MovieListViewModel
    
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                if songListViewModel.songs.count != 0 {
                    SongSectionView(songListViewModel: songListViewModel)
                }
                
                if moviewListViewModel.movie.count != 0 {
                    MovieSectionView(moviewListViewModel: moviewListViewModel)
                }
                
                if albumListViewModel.albums.count != 0 {
                    AlbumSectionView(albumListViewModel: albumListViewModel)
                }
                
            }
        }
    }
}
