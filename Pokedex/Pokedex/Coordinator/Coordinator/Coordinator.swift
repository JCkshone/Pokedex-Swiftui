//
//  Coordinator.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import SwiftUI

final class Coordinator: ObservableObject, CoordinatorProtocol {
    let navigationController: UINavigationController
    let startingRoute: RouterNavigation?

    init(
        navigationController: UINavigationController = .init(),
        startingRoute: RouterNavigation? = nil
    ) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
    }

    func start() {
        guard let route = startingRoute else { return }
        show(route, animated: true)
    }

    func show(
        _ route: RouterNavigation,
        animated: Bool
    ) {
        let view = route.view()
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = PokedexHostingController<AnyView>(rootView: AnyView(viewWithCoordinator))
    
        if case .default = route.transition {
            navigationController.view.layer.add(
                Transitions.fade,
                forKey: nil
            )
            navigationController.pushViewController(
                viewController,
                animated: false
            )
            return
        }

        viewController.modalPresentationStyle = route.transition.presentationStyle
        viewController.modalTransitionStyle = route.transition.transitionStyle

        navigationController.dismiss(animated: true) { [weak self] in
            delay {
                self?.navigationController.present(
                    viewController,
                    animated: true
                )
            }
        }
    }
    
    func pop() {
        navigationController.view.layer.add(
            Transitions.fade,
            forKey: nil
        )
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.view.layer.add(
            Transitions.fade,
            forKey: nil
        )
        navigationController.popToRootViewController(animated: true)
    }
    
    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: animated)
    }
}
