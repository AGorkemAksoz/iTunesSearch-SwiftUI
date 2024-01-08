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
    let wrapperType: WrapperType?
    let kind: Kind?
    let artistID, collectionID: Int?
    let id: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: Date?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistName: CollectionArtistName?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case contentAdvisoryRating
    }
}

enum CollectionArtistName: String, Codable {
    case jackJohnson = "Jack Johnson"
    case tomRussell = "Tom Russell"
    case variousArtists = "Various Artists"
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case song = "song"
}

enum WrapperType: String, Codable {
    case track = "track"
}
