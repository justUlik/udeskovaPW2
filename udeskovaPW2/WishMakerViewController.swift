//
//  WishMakerViewController.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 03.11.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - Fields
    private let headingView = Heading()
    private var colorModel = ColorModel()
    private let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ToggleConstants.toggleButtonTitleHide, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let stack = UIStackView()
    private let addWishButton: UIButton = UIButton(type: .system)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private methods: UI Configuration
    private func configureUI() {
        view.backgroundColor = .systemOrange
        
        configureHeading()
        configureAddWishButton()
        configureSliders()
        configureToggleButton()
    }
    
    private func configureHeading() {
        view.addSubview(headingView)
        headingView.pinLeft(to: view)
        headingView.pinRight(to: view)
        headingView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    private func configureAddWishButton() {
        view.addSubview(addWishButton)
        addWishButton.setHeight(AddWishButtonConstants.buttonHeight)
        addWishButton.pinBottom(to: view, AddWishButtonConstants.buttonBottom)
        addWishButton.pinHorizontal(to: view, AddWishButtonConstants.buttonSide)
        
        addWishButton.backgroundColor = .white
        addWishButton.setTitleColor(.systemPink, for: .normal)
        addWishButton.setTitle(AddWishButtonConstants.buttonText, for: .normal)
        
        addWishButton.layer.cornerRadius = AddWishButtonConstants.buttonRadius
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    private func configureSliders() {
        stack.axis = .vertical
        stack.layer.cornerRadius = SliderConstants.stackRadius
        stack.clipsToBounds = true
        view.addSubview(stack)
        
        let sliderRed = CustomSlider(title: SliderConstants.red, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        let sliderGreen = CustomSlider(title: SliderConstants.green, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        let sliderBlue = CustomSlider(title: SliderConstants.blue, min: Double(SliderConstants.minValue), max: Double(SliderConstants.maxValue))
        
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            stack.addArrangedSubview(slider)
        }
        
        stack.pinCenterX(to: view)
        stack.pinLeft(to: view, SliderConstants.stackLeading)
        
        stack.pinBottom(to: addWishButton.topAnchor, SliderConstants.stackBottomOffset)

        sliderRed.valueChanged = { [weak self] value in
            self?.colorModel.red = Float(value)
            self?.updateBackgroundColor()
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.colorModel.green = Float(value)
            self?.updateBackgroundColor()
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.colorModel.blue = Float(value)
            self?.updateBackgroundColor()
        }
    }
    
    private func configureToggleButton() {
        view.addSubview(toggleButton)
        toggleButton.setWidth(mode: .equal, ToggleConstants.toggleButtonWidth)
        toggleButton.setHeight(mode: .equal, ToggleConstants.toggleButtonHeight)
        toggleButton.pinBottom(to: stack.topAnchor, ToggleConstants.toggleButtonBottomOffset)
        toggleButton.pinRight(to: view.trailingAnchor, ToggleConstants.toggleButtonTrailingOffset)
            
        
        toggleButton.addTarget(self, action: #selector(toggleSliders), for: .touchUpInside)
    }

    
    // MARK: - Private Methods: Update Methods
    private func updateBackgroundColor() {
        view.backgroundColor = colorModel.uiColor
    }
    
    // MARK: - Action Methods
    @objc private func toggleSliders() {
        let isHidden = stack.isHidden
        stack.isHidden = !isHidden
        let newTitle = isHidden ? ToggleConstants.toggleButtonTitleHide : ToggleConstants.toggleButtonTitleShow
        toggleButton.setTitle(newTitle, for: .normal)
    }
    
    @objc
    private func addWishButtonPressed() {
    // this will be done later!
    }
}
