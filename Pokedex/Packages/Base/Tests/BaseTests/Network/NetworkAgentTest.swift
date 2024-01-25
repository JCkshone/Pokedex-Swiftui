//
//  NetworkAgentTest.swift
//  
//
//  Created by Juan Camilo Navarro on 23/01/24.
//

import XCTest
import Combine
@testable import Base

final class NetworkAgentTest: XCTestCase {
    var sut: NetworkAgentProtocol!
    var cancellable = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = NetworkAgent()
    }
    
    override func tearDown() {
        sut = nil
        cancellable.removeAll()
        super.tearDown()
    }

    func testExecuteRun_Success() throws {
        let expectation = XCTestExpectation(description: "Success network run")
        var pokemons: [PokemonSearch] = []
        
        pokemosMock(.pokemos)
            .map { $0.response.results }
            .sink { _ in
            } receiveValue: { response in
                pokemons = response
                expectation.fulfill()
            }.store(in: &cancellable)

        wait(for: [expectation], timeout: 10.0)
        XCTAssertFalse(pokemons.isEmpty)
    }
    
    func testExecuteRun_Error() throws {
        let expectation = XCTestExpectation(description: "Success network run")
        var error: Error?
        
        pokemosMock(.pokemonError)
            .map { $0.response.results }
            .sink { completion in
                if case let .failure(errorResponse) = completion {
                    error = errorResponse
                    expectation.fulfill()
                }
            } receiveValue: { _ in
            }.store(in: &cancellable)

        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(error)
    }
    
    func pokemosMock(_ routable: MockRoutable) -> AnyPublisher<ApiResponse<PokemonPagination>, Error> {
        sut.run(routable)
            .eraseToAnyPublisher()
    }
}
