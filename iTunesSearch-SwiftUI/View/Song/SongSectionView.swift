//
//  SongSectionView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 14.01.2024.
//

import SwiftUI

struct SongSectionView: View {
    
    @ObservedObject var songListViewModel: SongListViewModel
    
    let rows = Array(repeating: GridItem(.fixed(60), spacing: -14), count: 5)
    
    var body: some View {
        HStack {
            Text("Songs")
            Spacer()
            NavigationLink {
                SongListView(viewModel: songListViewModel)
            } label: {
                HStack {
                    Text("See All")
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding(.horizontal)
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(songListViewModel.songs, id: \.id) { song in
                    HStack {
                        AsyncPhoto(entityType: .song, song: song)
                        ItemInfo(entityType: .song, song: song)
                        Spacer()
                        PriceTag(price: String(song.trackPrice ?? 0), currency: song.currency == "USD" ? "$" : "€")
                    }
                    .frame(width: UIScreen.main.bounds.width - 120)
                }
            }
        }
    }
}
