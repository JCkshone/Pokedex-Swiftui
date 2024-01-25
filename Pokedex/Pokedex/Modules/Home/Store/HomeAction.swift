//
//  HomeAction.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation

enum HomeAction {
    case load(_ page: Int, _ limit: Int)
    case loadSuccess(_ pokemos: [Pokemon], _ types: [PokemonType])
    case loadFailure(_ error: Error)
}
