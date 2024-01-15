//
//  AlbumDetailView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 15.01.2024.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    @StateObject var songsViewModel: SongsForAlbumListViewModel
    
    init(album: Album) {
        self.album = album
        self._songsViewModel = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: album.id))
    }
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Link(destination: URL(string: album.collectionViewURL!)!, label: {
                    AsyncImage(url: URL(string: album.artworkUrl100!)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                    } placeholder: {
                        ProgressView()
                    }
                })
                
                VStack(alignment: .leading) {
                    Text(album.collectionName ?? "Unknown Album")
                    Text(album.artistName ?? "Unknown Artist")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(album.primaryGenreName ?? "Unknown Genre")
                    Text("\(album.trackCount!) Songs")
                    Text("Released: \(formattedDate(for:album.releaseDate!))")
                }
                .frame(height: 120)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
                
                Spacer()
                
                PriceTag(price: String(album.collectionPrice!), currency: (album.currency == "USD" ? "$" : "€"))
            }
            .padding(.horizontal)
            
            SongsForAlbumListView(songsViewModel: songsViewModel)
        }
    }
    
    func formattedDate(for value: String) -> String {
        let dateFormetterGetter = DateFormatter()
        dateFormetterGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormetterGetter.date(from: value) else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
        
    }
}
