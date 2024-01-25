//
//  LoggerContext.swift
//  
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Foundation

struct LoggerContext {
    let file: String
    let function: String
    let line: Int
    
    var description: String {
        "\((file as NSString).lastPathComponent) : \(line) \(function)"
    }
}
