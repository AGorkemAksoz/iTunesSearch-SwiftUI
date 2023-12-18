//
//  SongViewModel.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import Foundation

class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = [Song]()
    @Published var state: FetchState = .good
    
    let limit: Int = 20
    private let service: APIService = APIService()
    var page: Int = 0
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }

        state = .isLoading
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    for song in result.results! {
                        self?.songs.append(song)
                    }
                    self?.page += 1
                    self?.state = (result.results?.count == self?.limit) ? .good : .loadedAll
                    print("fetched \(result.resultCount)")
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                    
                }
            }
        }
        
        
    }
}
