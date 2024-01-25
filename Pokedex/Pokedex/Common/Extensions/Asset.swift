//
//  Asset.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import SwiftUI

typealias PokeAsset = PokedexResources.Assets

extension Image {
    init(with asset: ImageAsset) {
        self.init(uiImage: asset.image)
    }
}

extension ImageAsset {
    var imageName: String {
        (self.name.components(separatedBy: "/").last ?? "").lowercased()
    }
    
    static func findBy(name: String) -> ImageAsset {
        guard let asset = PokedexResources.Assets.allImages.first(where: { $0.imageName == name }) else {
            return PokeAsset.Common.pokedex
        }
        return asset
    }
}
