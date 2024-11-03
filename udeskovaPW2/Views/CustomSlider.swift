//
//  CustomSlider.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 03.11.2024.
//

import UIKit

final class CustomSlider: UIView {
    // MARK: - Properties
    var valueChanged: ((Double) -> Void)?
    
    var slider = UISlider()
    var titleView = UILabel()
    
    // MARK: - Lifecycle methods
    init(title: String, min:Double, max:Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureUI() {
        backgroundColor = .white
        
        for view in [slider, titleView] {
            addSubview(view)
        }
        
        titleView.pinCenterX(to: self)
        titleView.pinTop(to: self, SliderConstants.sliderTitleViewTopOffset)
        titleView.pinLeft(to: self, SliderConstants.sliderTitleViewLeadingOffset)
        
        slider.pinTop(to: titleView.bottomAnchor, SliderConstants.sliderTopOffset)
        slider.pinCenterX(to: self)
        slider.pinBottom(to: self, -1 * SliderConstants.sliderBottomOffset)
        slider.pinLeft(to: self, SliderConstants.sliderLeadingOffset)
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
}
