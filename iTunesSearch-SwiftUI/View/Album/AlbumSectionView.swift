//
//  AlbumSectionView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 14.01.2024.
//

import SwiftUI

struct AlbumSectionView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    
    var body: some View {
        HStack {
            Text("Albums")
            Spacer()
            NavigationLink {
                AlbumListView(viewModel: albumListViewModel)
            } label: {
                HStack {
                    Text("See All")
                    Image(systemName: "chevron.right")
                }
            }
        }
        
        .padding(.horizontal)
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(albumListViewModel.albums, id: \.id) { album in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: album.artworkUrl100!)) { image in
                            image
                                .resizable()
                                .frame(height: 90)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(album.collectionName ?? "Unknown Album")
                            .lineLimit(2)
                            .font(.footnote)
                        Text(album.artistName ?? "Unknown Artist")
                            .font(.system(size: 10, weight: .thin))
                        Spacer()
                    }
                    .frame(width: 100)
                }
            }
        }
        .padding(.leading, 8)
        .frame(height: 200)
    }
}
