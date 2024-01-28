//
//  PokemonCapabilityView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 27/01/24.
//

import SwiftUI

struct PokemonCapabilityView: View {
    var title: String
    var iconName: String
    var value: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconName)
                    .font(.system(size: 16))
                    .foregroundColor(.black.opacity(0.7))
                Text(title.uppercased())
                    .font(.custom(.regular, size: 12))
                    .foregroundColor(.black.opacity(0.7))
                Spacer()
            }
            Text(value)
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
}


#Preview {
    PokemonCapabilityView(
        title: "",
        iconName: "",
        value: ""
    )
}
