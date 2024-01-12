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
                    HStack {

                        AsyncPhoto(entityType: .song, song: song)
                        
                        ItemInfo(entityType: .song, song: song)
                        
                        Spacer()
                        
                        PriceTag(price: String(song.trackPrice ?? 0), currency: song.currency == "USD" ? "$" : "€")
                    }
                    .padding(.bottom, -6)
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

struct SongListView_Previews: PreviewProvider  {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.example())
    }
}
