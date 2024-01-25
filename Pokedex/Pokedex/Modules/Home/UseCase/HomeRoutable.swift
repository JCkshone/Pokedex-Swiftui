//
//  HomeRoutable.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import Foundation
import Base

enum HomeRoute {
    case load(page: Int, numberItems: Int)
    case findPokemon(id: Int)
}

protocol HomeRouteable: ApiRoutable {
    var route: HomeRoute { get set }
}

struct HomeRouter: HomeRouteable {
    var route: HomeRoute
}

extension HomeRouteable {
    var queryParams: HttpQueryParams {
        guard case let .load(page, numberItems) = route else {
            return [:]
        }
        return [
            Constants.Key.offset: "\(page)",
            Constants.Key.limit: "\(numberItems)"
        ]
    }
    
    var path: String {
        switch self.route {
        case .load: return "/api/v2/pokemon"
        case let .findPokemon(id): return "/api/v2/pokemon/\(id)"
        }
    }
    
    var method: HttpMethod { .get }
}
