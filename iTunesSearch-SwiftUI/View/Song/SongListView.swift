//
//  SongListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 4.01.2024.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var viewModel : SongListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) { song in
                    Text(song.trackName ?? "Unknown Song")
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
