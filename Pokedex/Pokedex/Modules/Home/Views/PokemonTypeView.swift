//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import SwiftUI

struct PokemonTypeView: View {
    var type: PokemonType
    var body: some View {
        HStack {
            Image(with: type.icon)
                .resizable()
                .frame(width: 16, height: 16)
                .padding(.all, 3)
                .background(Color.white)
                .clipShape(.circle)
            Text(type.rawValue.capitalized)
                .font(.custom(.regular, size: 11))
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(
            with: type.color,
            opacity: 0.7
        )
        .clipShape(.capsule)
    }
}

#Preview {
    PokemonTypeView(type: .bug)
}
