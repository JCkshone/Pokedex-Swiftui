//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 20/01/24.
//
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {

    private let coordinator: Coordinator = .init(startingRoute: SplashCoordinator.splash)

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}
