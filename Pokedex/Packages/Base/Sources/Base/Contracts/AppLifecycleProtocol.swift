//
//  AppLifecycleProtocol.swift
//
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation
import UIKit

public typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

public protocol AppLifecycleProtocol {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?
    ) -> Bool
}

public extension AppLifecycleProtocol {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?
    ) -> Bool {
        return true
    }
}
