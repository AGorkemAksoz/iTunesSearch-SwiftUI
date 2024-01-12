//
//  Album.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 26.10.2023.
//

import Foundation

// MARK: - Album
struct AlbumResult : Codable {
    let resultCount: Int?
    let results: [Album]?
}

// MARK: - Album
struct Album: Codable, Identifiable {
    let wrapperType, collectionType: String?
    let id: Int
    let artistID, amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: String?
    let trackCount: Int?
    let copyright, country, currency: String?
    let releaseDate: String?
    let primaryGenreName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id  = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
    
    static func previewAlbum() -> Album {
        Album(wrapperType: Optional("collection"),
              collectionType: Optional("Album"),
              id: 1456789831,
              artistID: Optional(408932),
              amgArtistID: nil,
              artistName: Optional("Rammstein"),
              collectionName: Optional("Rammstein"),
              collectionCensoredName: Optional("Rammstein"),
              artistViewURL: Optional("https://music.apple.com/us/artist/rammstein/408932?uo=4"),
              collectionViewURL: Optional("https://music.apple.com/us/album/rammstein/1456789831?uo=4"),
              artworkUrl60: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/52/c0/4b/52c04bfb-7eb1-a158-1ac9-e1d4c82ce146/19UMGIM06727.rgb.jpg/60x60bb.jpg"),
              artworkUrl100: Optional("https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/52/c0/4b/52c04bfb-7eb1-a158-1ac9-e1d4c82ce146/19UMGIM06727.rgb.jpg/100x100bb.jpg"),
              collectionPrice: Optional(11.99),
              collectionExplicitness:  Optional("notExplicit"),
              trackCount: Optional(11),
              copyright: Optional("A Vertigo/Capitol release; ℗ 2019 RAMMSTEIN GBR, under exclusive license to Universal Music GmbH"),
              country: Optional("USA"),
              currency: Optional("USD"),
              releaseDate: Optional("2019-05-17T07:00:00Z"),
              primaryGenreName: Optional("Metal")
        )
    }
}
