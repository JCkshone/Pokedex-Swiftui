//
//  HeaderDetailView.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 26/01/24.
//

import SwiftUI

struct HeaderDetailView: View {
    var pokemonImage: String
    var imagePlaceholder: ImageAsset
    var pokemonType: PokemonType
    var action: () -> Void
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(systemName: "xmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .zIndex(1000)
                    .onTapGesture(perform: action)
                    .position(x: proxy.frame(in: .global).maxX - 30,
                              y: 60)
                Rectangle()
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(
                            stops: pokemonType.gradient,
                            startPoint: UnitPoint(x: 0.28, y: 0.42),
                            endPoint: UnitPoint(x: 0.74, y: 1)
                        )
                    )
                    .clipShape(
                        .rect(
                            cornerRadii: RectangleCornerRadii(
                                bottomLeading: .infinity,
                                bottomTrailing: .infinity
                            ),
                            style: .continuous
                        )
                    )
                ZStack(alignment: .center) {
                    Image(with: imagePlaceholder)
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    AsyncImage(url: URL(string: pokemonImage)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 300)
                            .offset(y: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

#Preview {
    HeaderDetailView(
        pokemonImage: "",
        imagePlaceholder: PokeAsset.Types.bug,
        pokemonType: .bug
    ) {}
}
