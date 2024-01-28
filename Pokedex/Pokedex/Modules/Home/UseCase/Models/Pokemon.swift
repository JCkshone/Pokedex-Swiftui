//
//  Pokemon.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation
import Base

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let art: String
    let image: String
    let weight: Int
    let height: Int
    let types: [PokemonType]
    let abilities: [PokemonAbilities]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case weight
        case height
        case abilities
    }
    
    init(
        id: Int,
        name: String,
        art: String,
        image: String,
        weight: Int,
        height: Int,
        types: [PokemonType],
        abilities: [PokemonAbilities]
    ) {
        self.id = id
        self.name = name
        self.art = art
        self.image = image
        self.weight = weight
        self.height = height
        self.types = types
        self.abilities = abilities
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let values = try? container.decode([String: Any].self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        weight = try container.decode(Int.self, forKey: .weight)
        height = try container.decode(Int.self, forKey: .height)
        art = "\(Constants.Api.baseImageArtUrl)\(id).png"
        image = "\(Constants.Api.baseImageUrl)\(id).png"
        
        if let valueDict = values?["types"] as? [[String: Any]] {
            types = valueDict.compactMap {
                try? JSONDecoder().decode(PokemonTypes.self, from: JSONSerialization.data(withJSONObject: $0))
            }.map { $0.type.name }
        } else {
            types = []
        }
        
        if let abilitiesDict = values?["abilities"] as? [[String: Any]] {
            abilities = abilitiesDict.compactMap {
                try? JSONDecoder().decode(PokemonAbilities.self, from: JSONSerialization.data(withJSONObject: $0))
            }
        } else {
            abilities = []
        }
    }
}

struct PokemonPagination: Decodable {
    let results: [PokemonSearch]
}

struct PokemonSearch: Decodable {
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let components = try container.decode(String.self, forKey: .url).components(separatedBy: "/")
        id = Int(components[components.count - 2])
    }
}
