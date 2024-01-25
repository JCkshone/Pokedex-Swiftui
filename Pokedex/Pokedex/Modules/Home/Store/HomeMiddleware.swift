//
//  HomeMiddleware.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation
import Resolver
import Base
import Combine

enum HomeMiddleware {
    @Injected private static var homeUseCase: HomeUseCaseProtocol
    
    static func executeGetPokemonsInfo() -> Middleware<HomeState, HomeAction> {
        { _, action in
            guard case let .load(page, limit) = action else { return Empty().eraseToAnyPublisher() }
            
            return homeUseCase
                .execute(page: page, numberItems: limit)
                .map { $0.response.results.compactMap { $0.id } }
                .flatMap { ids -> AnyPublisher<[Pokemon], Error> in
                    Publishers.Sequence(sequence: ids)
                        .flatMap { id in
                            homeUseCase
                                .execute(for: id)
                                .map { $0.response }
                                .eraseToAnyPublisher()
                        }
                        .collect()
                        .map { $0 }
                        .eraseToAnyPublisher()
                }
                .map { .loadSuccess($0, $0.flatMap { $0.types }) }
                .catch { log(error: $0, dispatch: .loadFailure($0)) }
                .eraseToAnyPublisher()
        }
    }
}

extension HomeMiddleware {
    private static func log(error: Error, dispatch: HomeAction) -> AnyPublisher<HomeAction, Never> {
        BaseLogger.error("[\(String(describing: self))] Causal: \(error)")
        return Just(dispatch).setFailureType(to: Never.self).eraseToAnyPublisher()
    }
}
