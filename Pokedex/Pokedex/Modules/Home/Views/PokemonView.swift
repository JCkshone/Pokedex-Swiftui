//
//  PokemonView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 23/01/24.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                VStack {
                    Text(String(format: "%@%03d", "Nº", pokemon.id))
                        .font(.custom(.medium, size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(pokemon.name.capitalized)
                        .font(.custom(.medium, size: 21))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        ForEach(pokemon.types) { type in
                            PokemonTypeView(type: type)
                        }
                        Spacer()
                    }
                }.padding(.all, 16)
                
                ZStack {
                    Image(with: (pokemon.types.first ?? .normal).iconClear)
                        .resizable()
                    AsyncImage(url: URL(string: pokemon.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                }
                .padding(.all, 8)
                .background(with: (pokemon.types.first ?? .normal).color)
                .clipShape(.rect(cornerRadius: 15))
                .frame(width: 126)
            }
            .foregroundColor(.black)
            .background(with: (pokemon.types.first ?? .normal).color, opacity: 0.3)
            .clipShape(.rect(cornerRadius: 15))
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    PokemonView(
        pokemon: Pokemon(
            id: .zero,
            name: .empty, 
            art: .empty,
            image: .empty, 
            weight: .zero, 
            height: .zero,
            types: [], 
            abilities: []
        )
    ) {
        
    }.frame(height: 120)
}
