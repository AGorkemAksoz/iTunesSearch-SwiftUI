//
//  FetchState.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import Foundation


enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
