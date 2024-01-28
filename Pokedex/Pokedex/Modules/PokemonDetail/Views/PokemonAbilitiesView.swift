//
//  PokemonAbilitiesView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 27/01/24.
//

import SwiftUI

struct PokemonAbilitiesView: View {
    var abilities: [PokemonAbilities]
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "trophy.circle")
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.7))
                Text("Habilidades".uppercased())
                    .font(.custom(.medium, size: 12))
                    .foregroundColor(.black.opacity(0.7))
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(abilities) { pokemonAbility in
                        Text(pokemonAbility.ability.name)
                            .frame(maxWidth: .infinity)
                            .font(.custom(.medium, size: 18))
                            .foregroundColor(.black)
                            .padding(.all, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        .gray.opacity(0.5),
                                        lineWidth: 1
                                    )
                            )
                    }
                }
                .padding(.all, 3)
            }
        }
        .padding(.all)
    }
}

#Preview {
    PokemonAbilitiesView(abilities: [])
}
