//
//  MockRoutable.swift
//
//
//  Created by Juan Camilo Navarro on 24/01/24.
//
import Foundation

@testable import Base

enum MockRoutable: ApiRoutable {
    case pokemos
    case pokemonError
}

extension MockRoutable {
    var baseUrl: URL {
        switch self {
        case .pokemos:
            return Bundle.module.dataFromResource("pokemos")
        case .pokemonError:
            return URL(fileURLWithPath: .empty)
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var debugMode: Bool {
        return true
    }
}
