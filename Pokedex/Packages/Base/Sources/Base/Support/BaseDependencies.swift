//
//  BaseDependencies.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation
import Resolver

enum BaseDependencies {
    public static func build() {
        // MARK: - Network
        Resolver.register { NetworkProvider() as NetworkProviderProtocol }
    }
}
