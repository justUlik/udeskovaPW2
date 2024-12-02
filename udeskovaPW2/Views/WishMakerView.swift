//
//  WishMakerView.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 30.11.2024.
//
import UIKit

final class WishMakerView: UIView {
    // MARK: - UI Components
    let headingView = WishMakerHeading()
    let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ToggleConstants.toggleButtonTitleHide, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let stack = UIStackView()
    let addMoreWishesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitle(WishMakerButtonConstants.addMoreWishesTitle, for: .normal)
        button.layer.cornerRadius = WishMakerButtonConstants.buttonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let scheduleWishesButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitle(WishMakerButtonConstants.scheduleMissionsTitle, for: .normal)
        button.layer.cornerRadius = WishMakerButtonConstants.buttonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let actionStack = UIStackView()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        backgroundColor = .systemOrange
        configureHeading()
        configureActionStack()
        configureSliders()
        configureToggleButton()
    }
    
    private func configureHeading() {
        addSubview(headingView)
        headingView.pinLeft(to: self)
        headingView.pinRight(to: self)
        headingView.pinTop(to: self.safeAreaLayoutGuide.topAnchor)
    }
    
    private func configureActionStack() {
        actionStack.axis = .vertical
        addSubview(actionStack)
        actionStack.spacing = WishMakerButtonConstants.spacing
        for button in [addMoreWishesButton, scheduleWishesButton] {
            actionStack.addArrangedSubview(button)
        }
        configureaddMoreWishesButton()
        configureScheduleWishesButton()
        actionStack.pinBottom(to: self, WishMakerButtonConstants.stackBottom)
        actionStack.pinHorizontal(to: self, WishMakerButtonConstants.stackLeading)
    }
    
    private func configureaddMoreWishesButton() {
        addMoreWishesButton.setHeight(WishMakerButtonConstants.buttonHeight)
    }
    
    private func configureScheduleWishesButton() {
        scheduleWishesButton.setHeight(WishMakerButtonConstants.buttonHeight)
    }
    
    private func configureSliders() {
        stack.axis = .vertical
        stack.layer.cornerRadius = SliderConstants.stackRadius
        stack.clipsToBounds = true
        addSubview(stack)
        
        let sliderRed = CustomSlider(title: SliderConstants.red, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        let sliderGreen = CustomSlider(title: SliderConstants.green, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        let sliderBlue = CustomSlider(title: SliderConstants.blue, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            stack.addArrangedSubview(slider)
        }
        
        stack.pinCenterX(to: self)
        stack.pinLeft(to: self, SliderConstants.stackLeading)
        stack.pinBottom(to: addMoreWishesButton.topAnchor, SliderConstants.stackBottomOffset)
    }
    
    private func configureToggleButton() {
        addSubview(toggleButton)
        toggleButton.setWidth(mode: .equal, ToggleConstants.toggleButtonWidth)
        toggleButton.setHeight(mode: .equal, ToggleConstants.toggleButtonHeight)
        toggleButton.pinBottom(to: stack.topAnchor, ToggleConstants.toggleButtonBottomOffset)
        toggleButton.pinRight(to: trailingAnchor, ToggleConstants.toggleButtonTrailingOffset)
    }
}
