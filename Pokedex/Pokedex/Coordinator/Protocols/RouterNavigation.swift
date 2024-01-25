//
//  RouterNavigation.swift
//
//
//  Created by Juan Camilo Navarro on 19/01/24.
//
import SwiftUI

public enum NavigationType {
    case `default`
    case presentModally
    case presentFullscreen
    case modalFullScreen
    
    public var presentationStyle: UIModalPresentationStyle {
        switch self {
        case .default: return .none
        case .presentModally: return .formSheet
        case .presentFullscreen: return .fullScreen
        case .modalFullScreen: return .overFullScreen
        }
    }
    
    public var transitionStyle: UIModalTransitionStyle {
        switch self {
        case .default: return .flipHorizontal
        case .presentModally: return .coverVertical
        case .presentFullscreen: return .coverVertical
        case .modalFullScreen: return .crossDissolve
        }
    }
}

public protocol RouterNavigation {
    
    var transition: NavigationType { get }
    
    func view() -> AnyView
}
