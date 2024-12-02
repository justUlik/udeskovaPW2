//
//  UIFont+Extensions.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

extension UIFont {
    static func italicSystemFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        
        var traits = font.fontDescriptor.symbolicTraits
        
        if weight == .medium {
            traits.insert(.traitItalic)
        }
        
        let descriptor = font.fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: size)
    }
}
