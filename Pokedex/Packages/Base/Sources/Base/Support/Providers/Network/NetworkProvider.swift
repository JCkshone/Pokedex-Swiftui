//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

final class NetworkProvider: NetworkProviderProtocol {
    var agent: NetworkAgentProtocol
    
    init() { agent = NetworkAgent() }
}
