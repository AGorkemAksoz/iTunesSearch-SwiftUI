//
//  EntityType.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 28.12.2023.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
    
    func name() -> String {
        switch self {
        case .all:
            return "All"
        case .album:
            return "Album"
        case .song:
            return "Song"
        case .movie:
            return "Movie"
        }
    }
}
