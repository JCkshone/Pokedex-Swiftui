//
//  HomeReducer.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation

enum HomeReducer {
    static func reduce(
        state: inout HomeState,
        action: HomeAction
    ) {
        switch action {
        case .load:
            state = .loading
        case let .loadSuccess(pokemos, types):
            state = .loaded(pokemos, types)
        case let .loadFailure(error):
            state = .withError(error)
        }
    }
}
