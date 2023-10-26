//
//  AlbumListViewModel.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 26.10.2023.
//

import Combine
import Foundation
// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=song
// https://itunes.apple.com/search?term=jack+johnson&entity=movie


class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    let limit: Int = 20
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5) , scheduler: RunLoop.main)
            .sink { [weak self] term in
            self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
    }
    
    func fetchAlbums(for searchTerm: String) {
        
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(limit)") else {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("Fetch error: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let fetchedData = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = fetchedData.results ?? []
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }
        .resume()
    }
}
