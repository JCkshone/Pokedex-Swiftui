//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Combine
import Resolver
import Foundation

typealias Output = URLSession.DataTaskPublisher.Output

public protocol NetworkAgentProtocol {
    func run<T: Decodable>(_ router: ApiRoutable) -> AnyPublisher<ApiResponse<T>, Error>
}

final class NetworkAgent: NetworkAgentProtocol {}

// MARK: - Combine implemention base

extension NetworkAgent {
    func run<T: Decodable>(
        _ router: ApiRoutable
    ) -> AnyPublisher<ApiResponse<T>, Error> {
        do {
            let request = try router.buildRequest()
            return URLSession.shared
                .dataTaskPublisher(for: request)
                .tryMap {
                    router.debugMode ? try self.handleDataTaskOutputDebugMode($0) : try self.handleDataTaskOutput($0)
                }
                .tryMap { try self.handleDataMapper(statusCode: $0, with: $1, to: router) }
                .mapError { self.handleDataTaskError($0) }
                .eraseToAnyPublisher()
        } catch {
            return Fail<ApiResponse<T>, Error>(error: error as? BaseError.Api ?? .undefined).eraseToAnyPublisher()
        }
    }
}

// MARK: - Combine handle response

extension NetworkAgent {
    func handleDataTaskOutput(
        _ output: Output
    ) throws -> (Int, Data) {
        BaseLogger.info("[HTTP REQUEST] \(output.response.url as Any)")
        BaseLogger.info("[HTTP STATUS CODE] \((output.response as? HTTPURLResponse)?.statusCode ?? .zero)")
        
        guard let httpResponse = output.response as? HTTPURLResponse else {
            throw BaseError.Api.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return (httpResponse.statusCode, output.data)
        case 401:
            throw BaseError.Api.undefined
        default:
            throw BaseError.Api.invalidResponse
        }
    }
    
    func handleDataTaskOutputDebugMode(
        _ output: Output
    ) throws -> (Int, Data) {
        BaseLogger.info("[HTTP REQUEST] \(output.response.url as Any)")
        BaseLogger.info("[HTTP STATUS CODE] \((output.response as? HTTPURLResponse)?.statusCode ?? .zero)")

        return (200, output.data)
    }
    
    func handleDataTaskError(
        _ error: Error
    ) -> BaseError.Api {
        if let error = error as? URLError, error.code != .timedOut {
            return BaseError.Api.timeOut
        }
        return error as? BaseError.Api ?? .undefined
    }
    
    func handleDataMapper<T: Decodable>(
        statusCode: Int,
        with data: Data,
        to router: ApiRoutable
    ) throws -> ApiResponse<T> {
        guard let resultDecode: T = decode(data) else {
            throw BaseError.Api.invalidDecodableModel
        }
        
        return ApiResponse(
            response: resultDecode,
            code: statusCode
        )
    }
    
    func printData(for data: Data) throws {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return
        }
        BaseLogger.info("[HTTP RESPONSE] \(json)")
    }
}

extension NetworkAgent {
    func decode<T: Decodable>(_ data: Data) -> T? {
        var response: T?
        do {
            response = try JSONDecoder().decode(T.self, from: data)
        } catch {
            BaseLogger.error("[HTTP MAPPER] \(String(describing: T.self)) \(error)")
        }
        return response
    }
}
