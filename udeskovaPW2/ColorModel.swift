//
//  ColorModel.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 03.11.2024.
//

import UIKit

struct ColorModel {
    // MARK: - Properties
    var red = SliderConstants.minValue
    var green = SliderConstants.minValue
    var blue = SliderConstants.minValue
}

extension ColorModel {
    var uiColor: UIColor {
        return UIColor(red: CGFloat(red / SliderConstants.maxValue), green: CGFloat(green / SliderConstants.maxValue), blue: CGFloat(blue / SliderConstants.maxValue), alpha: SliderConstants.alpha)
    }
}
