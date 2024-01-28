//
//  PokemonDetailScreenView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 25/01/24.
//

import SwiftUI

struct PokemonDetailScreenView: View {
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
                action: completion
            )
            .frame(maxHeight: 300)
            .ignoresSafeArea(.container, edges: .top)
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
            .padding(.horizontal)
            
            Divider()
                .padding(.all)
            
            HStack(spacing: 20) {
                PokemonCapabilityView(
                    title: "Peso",
                    iconName: "scalemass",
                    value: "\(pokemon.weight) kg"
                )
                
                PokemonCapabilityView(
                    title: "Altura",
                    iconName: "square.resize",
                    value: "\(pokemon.height) m"
                )
            }
            .padding(.horizontal)
            
            PokemonAbilitiesView(abilities: pokemon.abilities)
            
            Spacer()
        }
    }
}

#Preview {
    PokemonDetailScreenView(
        pokemon: Pokemon(
            id: 120,
            name: "Bulbasaur",
            art: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
            image: .empty, 
            weight: .zero, 
            height: .zero,
            types: [], 
            abilities: []
        )
    ) {}
}
