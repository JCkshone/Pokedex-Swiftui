//
//  HomeState.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation

enum HomeState {
    case neverLoaded
    case loading
    case searching
    case loaded([Pokemon], [PokemonType])
    case withError(Error)
}
