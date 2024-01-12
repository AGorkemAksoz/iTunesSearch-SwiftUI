//
//  ItemInfo.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 12.01.2024.
//

import SwiftUI


struct ItemInfo: View {
    let entityType: EntityType
    var song: Song? = nil
    var movie: Movie? = nil
    var album: Album? = nil
    
    var body: some View {
        switch entityType {
        case .album:
            if let album = album {
                VStack(alignment: .leading, spacing: 2) {
                    Text(album.collectionName ?? "Unknown Song")
                        .font(.system(size: 14))
                    Text((album.artistName ?? "Unknown Artist"))
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(album.trackCount == 1 ? "Single" : String(album.trackCount ?? 0) + "Songs")
                }
            }
            
        case .song:
            if let song = song {
                VStack(alignment: .leading, spacing: 2) {
                    Text(song.trackName ?? "Unknown Song")
                        .font(.system(size: 14))
                    Text((song.artistName ?? "Unknown Artist") + "-" + (song.collectionName ?? ""))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        case .movie:
            if let movie = movie {
                VStack(alignment: .leading, spacing: 2) {
                    Text(movie.trackName ?? "Unknown Song")
                        .font(.system(size: 14))
                    Text((movie.kind ?? "Unknown Kind"))
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(movie.country ?? "Unknown Country")
                }
            }
        case .all:
            EmptyView()
        }
    }
}
