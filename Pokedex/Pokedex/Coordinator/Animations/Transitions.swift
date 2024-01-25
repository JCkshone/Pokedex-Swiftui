//
//  File.swift
//  
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import UIKit

public func delay(deadline: Double = .zero, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
        completion()
    }
}

enum Transitions {
    static var fade: CATransition = {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        return transition
    }()
}
