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
    
    let defaultLimits: Int = 50
    private let service: APIService = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.clear()
                self?.fetchMovies(for: term)
            }.store(in: &subscriptions)
        
    }
    
    func clear() {
        state = .good
        movie = []
//        page = 0
    }

    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }

        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):

                    self?.movie = result.results ?? []
                    
                    if result.resultCount == self?.defaultLimits {
                        self?.state = .good
                    } else {
                        self?.state = .loadedAll
                    }
                    
                    print("fetched \(result.resultCount)  \(result.results?.count)")
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
