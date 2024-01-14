//
//  MovieSectionView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Ali Görkem Aksöz on 13.01.2024.
//

import SwiftUI

struct MovieSectionView: View {
    @ObservedObject var moviewListViewModel: MovieListViewModel
    
    var body: some View {
        HStack {
            Text("Movies")
            Spacer()
            NavigationLink {
                MovieListView(viewModel: moviewListViewModel)
            } label: {
                HStack {
                    Text("See All")
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding(.horizontal)
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(moviewListViewModel.movie, id: \.trackID) { movie in
                    VStack(alignment: .leading) {
                        
                        AsyncImage(url: URL(string: movie.artworkUrl100!)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 130)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.bottom, 8)
                    
                        Text(movie.trackName ?? "Unkwon Movie")
                            .lineLimit(2)
                            .font(.footnote)
                        Text(movie.primaryGenreName ?? "Unknown Genre")
                            .font(.system(size: 10, weight: .thin))
                        Spacer()
                    }
                    .frame(width: 100)
                }
            }
        }
        .padding(.leading, 4)
        .frame(height: 200)
        
        Divider()
    }
}
