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
    var screenView: CGSize
    var action: () -> Void
    var body: some View {
        ZStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .offset(
                    x: screenView.width / 2.3,
                    y: -90
                )
                .zIndex(1000)
                .onTapGesture(perform: action)
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
                .frame(width: screenView.width + 100,
                       height: screenView.height / 2.7)
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
            .frame(
                width: screenView.width + 100,
                height: screenView.height / 2
            )
        }
        .frame(height: screenView.height / 2.7)
    }
}

#Preview {
    HeaderDetailView(
        pokemonImage: "",
        imagePlaceholder: PokeAsset.Types.bug,
        pokemonType: .bug,
        screenView: UIScreen.main.bounds.size
    ) {}
}
