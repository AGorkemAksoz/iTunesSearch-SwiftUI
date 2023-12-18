//
//  MovieListViewModel.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import Combine
import Foundation

class MovieListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var movie: [Movie] = [Movie]()
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
                self?.state = .good
                self?.movie = []
                self?.page = 0
                self?.fetchMovies(for: term)
            }.store(in: &subscriptions)
        
    }

    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }

        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    for movie in result.results! {
                        self?.movie.append(movie)
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
    
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
}
