//
//  PokemonType.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 23/01/24.
//

import Foundation

enum PokemonType: String, Decodable, Identifiable, CaseIterable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case shadow
    case none
    
    var id: String { String(reflecting: self) }
    
    var icon: ImageAsset {
        ImageAsset.findBy(name: self.rawValue)
    }
    
    var iconClear: ImageAsset {
        ImageAsset.findBy(name: String(format: "%@-clear", self.rawValue))
    }
    
    var color: ColorAsset {
        ColorAsset.findBy(name: self.rawValue)
    }
}

struct PokemonTypes: Decodable {
    let type: PokemonTypeName
}

struct PokemonTypeName: Decodable {
    let name: PokemonType
}
