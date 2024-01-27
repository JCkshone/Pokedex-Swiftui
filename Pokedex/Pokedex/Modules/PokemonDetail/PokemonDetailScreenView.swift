//
//  PokemonDetailScreenView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 25/01/24.
//

import SwiftUI

struct PokemonDetailScreenView: View {
    private var screenView = UIScreen.main.bounds.size
    
    var pokemon: Pokemon
    var completion: () -> Void
    
    init(
        pokemon: Pokemon,
        completion: @escaping () -> Void
    ) {
        self.pokemon = pokemon
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            HeaderDetailView(
                pokemonImage: pokemon.art,
                imagePlaceholder: (pokemon.types.first ?? .electric).iconClear, 
                pokemonType: pokemon.types.first ?? .electric,
                screenView: screenView,
                action: completion
            )
            VStack {
                Text(pokemon.name.capitalized)
                    .font(.custom(.regular, size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(format: "%@%03d", "Nº", pokemon.id))
                    .font(.custom(.regular, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black.opacity(0.7))
                HStack {
                    ForEach(pokemon.types) { type in
                        PokemonTypeView(type: type)
                    }
                    Spacer()
                }
            }
            .offset(x: 80)
            .padding(.top)
            
            Divider()
                .padding(.all)
            Spacer()
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    PokemonDetailScreenView(
        pokemon: Pokemon(
            id: 120,
            name: "Bulbasaur",
            art: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
            image: .empty,
            types: []
        )
    ) {}
}
