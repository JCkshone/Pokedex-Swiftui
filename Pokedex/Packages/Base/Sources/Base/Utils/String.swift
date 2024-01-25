//
//  String.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

public extension String {
    static var empty: String = ""
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
