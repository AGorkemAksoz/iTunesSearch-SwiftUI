//
//  AsyncPhoto.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 12.01.2024.
//

import SwiftUI

struct AsyncPhoto: View {
    let entityType: EntityType
    var song: Song? = nil
    var movie: Movie? = nil
    var album: Album? = nil
    var body: some View {
        switch entityType {
        case .all:
            EmptyView()
        case .album:
            if let album = album {
                Link(destination: URL(string: album.collectionViewURL!)!, label: {
                    AsyncImage(url: URL(string: album.artworkUrl100!)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                })

            }
        case .song:
            if let song = song {
                Link(destination: URL(string: song.trackViewURL!)!, label: {
                    AsyncImage(url: URL(string: song.artworkUrl100!)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    } placeholder: {
                        ProgressView()
                    }
                })
            }
        case .movie:
            if let movie = movie {
                Link(destination: URL(string: movie.previewURL!)!, label: {
                    AsyncImage(url: URL(string: movie.artworkUrl100!)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                })
            }
        }
    }
}
