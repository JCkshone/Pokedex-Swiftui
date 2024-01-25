//
//  HomeUseCase.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import Foundation
import Combine
import Resolver
import Base

// MARK: - Find City Use Cases
protocol HomeUseCaseProtocol: AnyObject {
    func execute(page: Int, numberItems: Int) -> AnyPublisher<ApiResponse<PokemonPagination>, Error>
    func execute(for id: Int) -> AnyPublisher<ApiResponse<Pokemon>, Error>

}

// MARK: - Find City Use Cases Implementation
final class HomeUseCase: HomeUseCaseProtocol {
    @Injected var network: NetworkProviderProtocol
    
    func execute(page: Int, numberItems: Int) -> AnyPublisher<ApiResponse<PokemonPagination>, Error> {
        network.agent.run(
            HomeRouter(
                route: .load(page: page, numberItems: numberItems)
            )
        )
    }
    
    func execute(for id: Int) -> AnyPublisher<ApiResponse<Pokemon>, Error> {
        network.agent.run(
            HomeRouter(
                route: .findPokemon(id: id)
            )
        )
    }
}
