//
//  ApiRoutable.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

public typealias HttpHeaders = [String: String]
public typealias HttpQueryParams = [String: String]

public protocol BaseUrl {
    var baseUrl: URL { get }
}

public protocol ApiRoutable: BaseUrl {
    var path: String { get }
    var queryParams: HttpQueryParams { get }
    var headers: HttpHeaders { get }
    var method: HttpMethod { get }
    var debugMode: Bool { get }
}

public extension ApiRoutable {
    var queryParams: HttpQueryParams { [:] }
    var baseUrl: URL {
        guard let url = Constants.Api.baseUrl else { fatalError("Base url could not be configured.") }
        return url
    }
    var headers: HttpHeaders {
        return [
            Constants.Key.contentType: Constants.Value.json,
            Constants.Key.accept: Constants.Value.json
        ]
    }
    
    var debugMode: Bool { false }
    
    func buildUrl() -> URL {
        let url: URL? = debugMode ? baseUrl : URL(string: baseUrl.appendingPathComponent(path).description)
        
        guard let url = url else {
            return URL(fileURLWithPath: .empty)
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryParams.compactMap {
            return URLQueryItem(
                name: $0.key, value: $0.value
            )
        }
        return urlComponents?.url ?? URL(fileURLWithPath: .empty)
    }
    
    func buildRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: buildUrl())
        urlRequest.httpMethod = method.rawValue
        
        headers.forEach { header in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        return urlRequest
    }
}
