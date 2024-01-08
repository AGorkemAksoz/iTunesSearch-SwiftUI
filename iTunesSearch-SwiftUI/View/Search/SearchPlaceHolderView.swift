//
//  SearchPlaceHolderView.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 8.01.2024.
//

import SwiftUI

struct SearchPlaceHolderView: View {
    @Binding var searchTerm: String
    let suggestions = ["rammstein", "cry to me", "maneskin"]
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button(action: {
                    searchTerm = text
                }, label: {
                    Text(text)
                        .font(.title2)
                })
            }
        }
    }
}
