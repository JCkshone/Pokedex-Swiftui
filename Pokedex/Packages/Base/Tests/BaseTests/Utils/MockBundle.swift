//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 24/01/24.
//

import Foundation

@testable import Base


extension Bundle {
    func dataFromResource(_ resource: String) -> URL {
        guard let mockURL = url(forResource: resource,
                                withExtension: "json") else {
                 fatalError("Failed to load \(resource) from bundle.")
        }
        return mockURL
    }
}
