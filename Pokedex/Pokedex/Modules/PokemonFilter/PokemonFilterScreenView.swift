//
//  PokemonFilterScreenView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 24/01/24.
//

import SwiftUI

struct PokemonFilterScreenView: View {
    @State private var searchValue: String = .empty
    @Binding var typeSelected: PokemonType
    var types: [PokemonType]
    var close: () -> Void
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: close) {
                        Image(systemName: "x.circle.fill")
                            .font(.custom(.regular, size: 30))
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                }
                ScrollView {
                    VStack {
                        ForEach(types) { type in
                            Button(action: {
                                typeSelected = type
                            }, label: {
                                Text(typeSelected == type ? "\(type.rawValue.capitalized) --" : type.rawValue.capitalized)
                                    .font(.custom(.regular, size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 4)
                                    .foregroundStyle(.black)
                            })
                            Divider()
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.all)
                .frame(height: 200)
                .background(with: PokeColor.Types.water, opacity: 0.3)
                .clipShape(.rect(cornerRadius: 10))
                Spacer()
            }
            .padding(.all)
            .padding(.vertical, 64)
        }
        .background(BackgroundBlurView())
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PokemonFilterScreenView(
        typeSelected: .constant(.normal),
        types: []
    ) {}
}
