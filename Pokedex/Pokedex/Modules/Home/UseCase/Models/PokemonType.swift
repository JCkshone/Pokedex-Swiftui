//
//  PokemonType.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 23/01/24.
//

import Foundation
import SwiftUI

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

struct PokemonAbilities: Decodable, Identifiable {
    var id: String { String(reflecting: self) }
    let ability: Ability
}

struct Ability: Decodable {
    let name: String
}

extension PokemonType {
    var gradient: [Gradient.Stop] {
        switch self {
        case .normal, .none:
            return [
                .init(color: Color(red: 0.57, green: 0.6, blue: 0.64), location: .zero),
                .init(color: Color(red: 0.57, green: 0.6, blue: 0.64), location: 1)
            ]
        case .fighting:
            return [
                .init(color: Color(red: 0.81, green: 0.25, blue: 0.42), location: .zero),
                .init(color: Color(red: 0.81, green: 0.25, blue: 0.42).opacity(0.5), location: 1.00),
            ]
        case .flying:
            return [
                .init(color: Color(red: 0.54, green: 0.67, blue: 0.89), location: .zero),
                .init(color: Color(red: 0.54, green: 0.67, blue: 0.89).opacity(0.5), location: 1.00),
            ]
        case .poison:
            return [
                .init(color: Color(red: 0.71, green: 0.4, blue: 0.81), location: .zero),
                .init(color: Color(red: 0.71, green: 0.4, blue: 0.81).opacity(0.5), location: 1.00),
            ]
        case .ground:
            return [
                .init(color: Color(red: 0.85, green: 0.47, blue: 0.27), location: .zero),
                .init(color: Color(red: 0.85, green: 0.47, blue: 0.27).opacity(0.5), location: 1.00),
            ]
        case .rock:
            return [
                .init(color: Color(red: 0.77, green: 0.72, blue: 0.55), location: .zero),
                .init(color: Color(red: 0.77, green: 0.72, blue: 0.55).opacity(0.5), location: 1.00),
            ]
        case .bug:
            return [
                .init(color: Color(red: 0.57, green: 0.76, blue: 0.18), location: .zero),
                .init(color: Color(red: 0.57, green: 0.76, blue: 0.18).opacity(0.5), location: 1.00),
            ]
        case .ghost, .shadow:
            return [
                .init(color: Color(red: 0.32, green: 0.41, blue: 0.68), location: .zero),
                .init(color: Color(red: 0.32, green: 0.41, blue: 0.68).opacity(0.5), location: 1.00),
            ]
        case .steel:
            return [
                .init(color: Color(red: 0.35, green: 0.56, blue: 0.64), location: .zero),
                .init(color: Color(red: 0.35, green: 0.56, blue: 0.64).opacity(0.5), location: 1.00),
            ]
        case .fire:
            return [
                .init(color: Color(red: 1, green: 0.62, blue: 0.33), location: .zero),
                .init(color: Color(red: 1, green: 0.62, blue: 0.33).opacity(0.5), location: 1.00),
            ]
        case .water:
            return [
                .init(color: Color(red: 0.31, green: 0.56, blue: 0.84), location: .zero),
                .init(color: Color(red: 0.31, green: 0.56, blue: 0.84).opacity(0.5), location: 1.00),
            ]
        case .grass:
            return [
                .init(color: Color(red: 0.39, green: 0.74, blue: 0.35), location: .zero),
                .init(color: Color(red: 0.39, green: 0.74, blue: 0.35).opacity(0.5), location: 1.00),
            ]
        case .electric:
            return [
                .init(color: Color(red: 0.96, green: 0.82, blue: 0.24), location: .zero),
                .init(color: Color(red: 0.96, green: 0.82, blue: 0.24).opacity(0.5), location: 1.00),
            ]
        case .psychic:
            return [
                .init(color: Color(red: 0.98, green: 0.44, blue: 0.47), location: .zero),
                .init(color: Color(red: 0.98, green: 0.44, blue: 0.47).opacity(0.5), location: 1.00),
            ]
        case .ice:
            return [
                .init(color: Color(red: 0.45, green: 0.81, blue: 0.75), location: .zero),
                .init(color: Color(red: 0.45, green: 0.81, blue: 0.75).opacity(0.5), location: 1.00),
            ]
        case .dragon:
            return [
                .init(color: Color(red: 0.04, green: 0.43, blue: 0.76), location: .zero),
                .init(color: Color(red: 0.04, green: 0.43, blue: 0.76).opacity(0.5), location: 1.00),
            ]
        case .dark:
            return [
                .init(color: Color(red: 0.35, green: 0.33, blue: 0.4), location: .zero),
                .init(color: Color(red: 0.35, green: 0.33, blue: 0.4).opacity(0.5), location: 1.00),
            ]
        case .fairy:
            return [
                .init(color: Color(red: 0.93, green: 0.56, blue: 0.9), location: .zero),
                .init(color: Color(red: 0.93, green: 0.56, blue: 0.9).opacity(0.5), location: 1.00),
            ]
        }
    }
}
