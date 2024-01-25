//
//  SearchView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchValue: String
    var action: () -> Void
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                    .foregroundColor(.gray.opacity(0.7))
                TextField("Search",
                          text: $searchValue)
                .font(.custom(.regular, size: 18))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        .gray.opacity(0.4),
                        lineWidth: 1
                    )
            )
            .padding(.vertical, 10)
            
            Button(action: action) {
                Image(systemName: "slider.horizontal.3")
                    .font(.custom(.medium, size: 30))
                    .foregroundColor(.gray.opacity(0.5))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView(searchValue: .constant("")) {
        
    }
}
