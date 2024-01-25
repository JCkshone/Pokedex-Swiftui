//
//  ApiResponse.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

public enum HttpMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

public enum BaseError {
    public enum Api: Error {
        case invalidUrl(url: String)
        case undefined
        case noInternet
        case invalidResponse
        case timeOut
        case invalidDecodableModel
        case invalidObject
    }
}

public struct ApiResponse<T: Decodable>: Sequence {
    public let response: T
    public let code: Int
    
    var id: Int = .zero
    
    public func makeIterator() -> AnyIterator<Int> {
        var current = 1 << id
        return AnyIterator<Int> {
            current >>= 1
            return current > 0 ? current : nil
        }
    }
}
