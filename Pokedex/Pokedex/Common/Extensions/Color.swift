//
//  Color.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import SwiftUI

typealias PokeColor = PokedexResources.Colors

extension View {
    func foregroundColor(with color: ColorAsset) -> some View {
        self.foregroundColor(color.swiftUIColor)
    }
    
    func background(with color: ColorAsset, opacity: Double = 1) -> some View {
        self.background(color.swiftUIColor.opacity(opacity))
    }
}

extension ColorAsset {
    var colorName: String {
        (self.name.components(separatedBy: "/").last ?? "").lowercased()
    }
    
    static func findBy(name: String) -> ColorAsset {
        guard let color = PokedexResources.Colors.allColors.first(where: { $0.colorName == name }) else {
            return PokeColor.Types.normal
        }
        return color
    }
}
