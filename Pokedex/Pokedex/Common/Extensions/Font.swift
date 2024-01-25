//
//  Font.swift
//  Pokedex
//
//  Created by Juan Camilo Navarro on 22/01/24.
//

import SwiftUI

enum PixelFont: String {
    case regular
    case medium
    case semiBold
    case bold
    
    var fontName: String {
        "PixelifySans-\(self.rawValue.capitalized)"
    }
}

extension Font {
    static func custom(_ name: PixelFont, size: CGFloat) -> Font {
        guard let font = UIFont(name: name.fontName, size: size) else {
            fatalError("Failed to load custom font: \(name)")
        }
        return Font(font)
    }
}
