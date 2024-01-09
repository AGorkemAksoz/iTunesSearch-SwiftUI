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
        VStack {
            Text("Search all")
            
            Text("Movies: \(moviewListViewModel.movie.count)")
            Text("Albums: \(albumListViewModel.albums.count)")
            Text("Songs: \(songListViewModel.songs.count)")
            
        }
    }
}
