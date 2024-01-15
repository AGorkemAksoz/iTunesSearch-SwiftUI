//
//  SongsForAlbumListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 15.01.2024.
//

import SwiftUI

struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(songsViewModel.songs) { song in
                    VStack {
                        HStack {
                            Text(String(song.trackNumber ?? 12345123))
                                .frame(width: 30)
                            Text(song.trackName ?? "Unknown Song")
                            Spacer()
                            Text(formattedDuration(for:song.trackTimeMillis!))
                                .padding(.trailing, 24)
                            
                            if let price = song.trackPrice {
                                Link(destination: URL(string: song.trackViewURL!)!, label: {
                                    PriceTag(price: String(price), currency: song.currency == "USD" ? "$" :"£" )
                                })
                            } else {
                                Text("ALBUM ONLY")
                            }
                            
                        }
                        .padding([.top, .horizontal])
                        .frame(width: UIScreen.main.bounds.width)
                        
                        Divider()
                    }

                }
            }
        }
    }
    
    func formattedDuration(for time: Int) -> String {
        let timeInSeconds = time / 1000
        
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        
        return formatter.string(from: interval) ?? ""
    }
}
