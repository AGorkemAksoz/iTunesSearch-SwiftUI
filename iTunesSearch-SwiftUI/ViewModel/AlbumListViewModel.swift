//
//  AlbumListViewModel.swift
//  ItunesSearchApp
//
//  Created by Karin Prater on 25.07.22.
//

import Combine
import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {

    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: FetchState = .good
    
    let limit: Int = 20
    private let service: APIService = APIService()
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.clear()
                self?.fetchAlbums(for: term)
            }.store(in: &subscriptions)
        
    }
    func clear() {
        state = .good
        albums = []
        page = 0
    }
    
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }
    
    func fetchAlbums(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }

        state = .isLoading
        
        service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    for album in result.results! {
                        self?.albums.append(album)
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
