//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 24/01/24.
//

@testable import Base

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
