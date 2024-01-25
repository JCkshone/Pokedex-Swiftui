//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import Foundation

public final class BaseRegistry: NSObject, AppLifecycleProtocol {
    public override init() {
        super.init()
        BaseDependencies.build()
    }
}
