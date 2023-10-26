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
}
