//
//  PokedexRegistry.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation
import Base
import Resolver

enum AppDependencies {
    public static func build() {
        // MARK: - Use Cases
        Resolver.register { HomeUseCase() as HomeUseCaseProtocol }
        
        // MARK: - Stores
        
        Resolver.register {
            Store<HomeState, HomeAction>(
                state: .neverLoaded,
                reducer: HomeReducer.reduce(state:action:),
                middlewares: [
                    HomeMiddleware.executeGetPokemonsInfo(),
                ]
            )
        }.scope(.cached)
    }
}


public final class PokedexRegistry: NSObject, AppLifecycleProtocol {
    public override init() {
        super.init()
        AppDependencies.build()
    }
}

struct AppRegistry {
    var registry: [AppLifecycleProtocol]
    
    init() {
        self.registry = [
            BaseRegistry(),
            PokedexRegistry()
        ]
    }
    
    func getRegistry() -> [AppLifecycleProtocol] { registry }
}
