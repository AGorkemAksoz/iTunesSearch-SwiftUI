//
//  AlbumListView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 18.12.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel : MovieListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movie, id: \.trackID) { movie in
                HStack {
                    
                    AsyncPhoto(entityType: .movie, movie: movie)
                    
                    ItemInfo(entityType: .movie, movie: movie)
                    
                    Spacer()
                    
                    PriceTag(price: String(movie.trackHDPrice ?? 0), currency: movie.currency == "USD" ? "$" : "€")
                }
            }
            
            switch viewModel.state {
            case .good:
                Color.clear
                    .onAppear(perform: {
                        viewModel.loadMore()
                    })
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                Color.gray
            case .error(let string):
                Text(string)
                    .foregroundColor(.pink)
            }
        }
        .listStyle(.plain)
        
    }
}
