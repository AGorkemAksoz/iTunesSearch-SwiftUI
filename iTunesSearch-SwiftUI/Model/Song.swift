//
//  Song.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 26.10.2023.
//

import Foundation

// MARK: - SongResult
struct SongResult: Codable {
    let resultCount: Int?
    let results: [Song]?
}

// MARK: - Song
struct Song: Codable, Identifiable{
    let wrapperType: String?
    let kind: String?
    let artistID, collectionID: Int?
    let id: Int?
    let artistName, collectionName, trackName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: String?
    let trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistName: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
    }
    
    static func privewSong() -> Song {
        Song(wrapperType: "track",
             kind: "song",
             artistID: 408932,
             collectionID: 1456789831,
             id: 1456789852,
             artistName: "Rammstein",
             collectionName: Optional("Rammstein"),
             trackName: Optional("Deutschland"),
             artistViewURL: Optional("https://music.apple.com/us/artist/rammstein/408932?uo=4"),
             collectionViewURL: Optional("https://music.apple.com/us/album/deutschland/1456789831?i=1456789852&uo=4"),
             trackViewURL: Optional("https://music.apple.com/us/album/deutschland/1456789831?i=1456789852&uo=4"),
             previewURL: Optional("https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/24/68/2e/24682e50-1671-77f2-cc4d-429df052da0a/mzaf_69925001964266423.plus.aac.p.m4a"),
             artworkUrl30: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/52/c0/4b/52c04bfb-7eb1-a158-1ac9-e1d4c82ce146/19UMGIM06727.rgb.jpg/30x30bb.jpg"),
             artworkUrl60: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/52/c0/4b/52c04bfb-7eb1-a158-1ac9-e1d4c82ce146/19UMGIM06727.rgb.jpg/60x60bb.jpg"),
             artworkUrl100: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/52/c0/4b/52c04bfb-7eb1-a158-1ac9-e1d4c82ce146/19UMGIM06727.rgb.jpg/100x100bb.jpg"),
             collectionPrice: Optional(11.99),
             trackPrice: Optional(1.29),
             releaseDate: Optional("2019-03-28T07:00:00Z"),
             trackCount: Optional(11),
             trackNumber: Optional(1),
             trackTimeMillis: Optional(323031),
             country: Optional("USA"),
             currency: Optional("USD"),
             primaryGenreName: Optional("Rock"),
             isStreamable: Optional(true),
             collectionArtistName: nil)
    }
}
