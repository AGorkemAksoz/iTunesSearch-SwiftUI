//
//  APIService.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 17.12.2023.
//

import Foundation

enum EntityType: String {
    case album
    case song
    case movie
}

class APIService {
    
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<AlbumResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, page: page, limit: limit, type: .album)
        fetch(type: AlbumResult.self, url: url, completion: completion)
        
    }
    
    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<SongResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, page: page, limit: limit, type: .song)
        fetch(type: SongResult.self, url: url, completion: completion)
        
    }
    
    func fetchMovies(searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, page: page, limit: limit, type: .movie)
        fetch(type: MovieResult.self, url: url, completion: completion)
        
    }
    
    func fetch<T: Codable>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error as? URLError{
                completion(Result.failure(.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                completion(Result.failure(.badResponse(response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch  {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    
    func createURL(for searchTerm: String, page: Int, limit: Int, type: EntityType) -> URL? {
        // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        let baseURL = "https://itunes.apple.com/search"
        
        let offset = page * limit
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: type.rawValue),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}