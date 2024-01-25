//
//  Coordinator.swift
//
//
//  Created by Juan Camilo Navarro on 19/01/24.
//

import Foundation

public protocol CoordinatorProtocol {
    func start()
    func pop()
    func popToRoot()
    func dismiss(animated: Bool)
    func show(_ route: RouterNavigation, animated: Bool)
}
