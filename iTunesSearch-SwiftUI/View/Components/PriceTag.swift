//
//  PriceTag.swift
//  iTunesSearch-SwiftUI
//
//  Created by Gorkem on 12.01.2024.
//

import SwiftUI

struct PriceTag: View {
    let price: String
    let currency: String
    var body: some View {
        HStack(content: {
            Text(price + currency)
            
        })
            .font(.system(size: 14).bold())
            .foregroundColor(.blue)
            .padding(6)
            .border(.blue, width: 1)
    }
}

