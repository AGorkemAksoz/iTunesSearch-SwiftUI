//
//  APIError.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 5.11.2023.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "Bad URL"
        case .urlSession(let error):
            return "URL Session Error: \(error.debugDescription)"
        case .badResponse(let int):
            return "Bad Response with Status Code: \(int)"
        case .decoding(let decodingError):
            return "Decoding Error \(decodingError!)"
        case .unknown:
            return "Unknown Error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "Something went wrong"
        case .urlSession(let uRLError):
            return uRLError?.localizedDescription ?? "Something went wrong"
        case .badResponse( _):
            return "Something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "Default Error"
        }
    }
    
}
