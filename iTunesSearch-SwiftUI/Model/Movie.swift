//
//  Movie.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 26.10.2023.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int?
    let results: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let wrapperType, kind: String?
    let artistID, trackID: Int?
    let artistName, trackName, trackCensoredName: String?
    let artistViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName, contentAdvisoryRating: String?
    let shortDescription, longDescription: String?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
    }
    
    static func preivewMovie() -> Movie {
        Movie(wrapperType: Optional("track"),
              kind: Optional("feature-movie"),
              artistID: nil,
              trackID: Optional(270711082),
              artistName: Optional("John McTiernan"),
              trackName: Optional("Die Hard"),
              trackCensoredName: Optional("Die Hard"),
              artistViewURL: nil,
              trackViewURL: Optional("https://itunes.apple.com/us/movie/die-hard/id270711082?uo=4"),
              previewURL: Optional("https://video-ssl.itunes.apple.com/itunes-assets/Video128/v4/7d/66/b8/7d66b81b-1b22-9871-c569-f5747e099850/mzvf_3801165875313849582.640x480.h264lc.U.p.m4v"),
              artworkUrl30: Optional("https://is1-ssl.mzstatic.com/image/thumb/Video118/v4/0b/e4/b9/0be4b9e4-ddb0-c206-6542-6bfe4846986b/pr_source.lsr/30x30bb.jpg"),
              artworkUrl60: Optional("https://is1-ssl.mzstatic.com/image/thumb/Video118/v4/0b/e4/b9/0be4b9e4-ddb0-c206-6542-6bfe4846986b/pr_source.lsr/60x60bb.jpg"),
              artworkUrl100: Optional("https://is1-ssl.mzstatic.com/image/thumb/Video118/v4/0b/e4/b9/0be4b9e4-ddb0-c206-6542-6bfe4846986b/pr_source.lsr/100x100bb.jpg"),
              collectionPrice: Optional(19.99),
              trackPrice: Optional(19.99),
              releaseDate: Optional("1988-07-15T07:00:00Z"),
              collectionExplicitness: Optional("notExplicit"),
              trackExplicitness: Optional("notExplicit"),
              trackTimeMillis: Optional(7935768),
              country: Optional("USA"),
              currency: Optional("USD"),
              primaryGenreName: Optional("Action & Adventure"),
              contentAdvisoryRating: Optional("R"),
              shortDescription: nil,
              longDescription: Optional("Facing Christmas 3,000 miles from his estranged wife and two children, New York policeman John McClane (Bruce Willis) flies to Los Angeles bearing presents and hoping to patch up his marriage.  Stylish and cool Hans Gruber (Alan Rickman) is in Los Angeles as well for the holiday season, but he\'s not there to give out presents. He\'s there to take: more than $600 million in negotiable bearer bonds from the multinational Nakatomi Corporation, where McClane\'s wife Holly (Bonnie Bedelia) is an executive. When the takeover becomes hostile, it\'s up to John McClane to take on the terrorists with all the grit and determination he can muster--but not without a sense of humor."),
              trackRentalPrice: Optional(3.99),
              collectionHDPrice: Optional(19.99),
              trackHDPrice: Optional(19.99),
              trackHDRentalPrice: Optional(3.99)
        )
    }
}
