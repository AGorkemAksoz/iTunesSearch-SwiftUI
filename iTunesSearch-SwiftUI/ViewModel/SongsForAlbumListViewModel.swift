//
//  SongsForAlbumListViewModel.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 15.01.2024.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    let albumID: Int
    @Published var songs = [Song]()
    @Published var state: FetchState = .good
    
    private let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        fetchSongs(for: albumID)
        print("init for songs for album \(albumID)")
    }
    
    func fetchSongs(for albumID: Int) {
        service.fetchSongs(for: albumID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    
                    var songs = result.results!
                    
                    if result.resultCount! > 0 {
                        _ = songs.removeFirst()
                    }
                    
                    self?.songs = songs
                    self?.state = .good
                    print("fetched \(result.resultCount) songs for albumID: \(albumID)")
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                    
                }
            }

        }
    }
}
