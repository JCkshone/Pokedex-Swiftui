//
//  SplashRouter.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 20/01/24.
//
import SwiftUI

enum SplashCoordinator: RouterNavigation {
    case splash
    case home

    public var transition: NavigationType { .default }

    public func view() -> AnyView {
        switch self {
        case .splash: AnyView(SplashScreenView())
        case .home: AnyView(HomeScreenView())
        }
    }
}
