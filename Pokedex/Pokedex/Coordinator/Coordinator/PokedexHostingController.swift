//
//  PokedexHostingController.swift
//  
//
//  Created by Juan Camilo Navarro on 20/01/24.
//

import SwiftUI

final class PokedexHostingController<Content: View>: UIHostingController<AnyView> {
    
    public init(rootView: Content) {
        super.init(rootView: AnyView(rootView.navigationBarHidden(true)))
    }
    
    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
