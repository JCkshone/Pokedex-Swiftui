//
//  Store.swift
//
//
//  Created by Juan Camilo Navarro on 21/01/24.
//

import Combine
import Foundation
import Resolver

public typealias Reducer<State, Action> = (inout State, Action) -> Void
public typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?

public final class Store<State, Action>: ObservableObject {
    @Published public private(set) var state: State

    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    private var cancellables = Set<AnyCancellable>()

    public init(
        state: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>] = []
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    public func dispatch(_ action: Action) {
        BaseLogger.info(
            "[Store \(String(describing: State.self))] dispatch Action: \(action)",
            .store
        )
        reducer(&state, action)

        for middleware in middlewares {
            guard let effect = middleware(state, action) else { break }
            effect
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }
}
