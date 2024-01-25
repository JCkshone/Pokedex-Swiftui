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
    let image: String
    let types: [PokemonType]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
    }
    
    init(
        id: Int,
        name: String,
        image: String,
        types: [PokemonType]
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.types = types
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        image = "\(Constants.Api.baseImageUrl)\(id).png"
        
        if let valueDict = try? container.decode([String: Any].self)["types"] as? [[String: Any]] {
            types = valueDict.compactMap {
                try? JSONDecoder().decode(PokemonTypes.self, from: JSONSerialization.data(withJSONObject: $0))
            }.map { $0.type.name }
        } else {
            types = []
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
