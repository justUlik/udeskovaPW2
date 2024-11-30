import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - Fields
    private let wishMakerView = WishMakerView()
    private var colorModel = ColorModel()
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        view = wishMakerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
    }
    
    // MARK: - Private Methods
    private func configureActions() {
        wishMakerView.toggleButton.addTarget(self, action: #selector(toggleSliders), for: .touchUpInside)
        
        wishMakerView.addMoreWishesButton.addTarget(self, action: #selector(addMoreWishesPressed), for: .touchUpInside)
        
        wishMakerView.scheduleWishesButton.addTarget(self, action: #selector(scheduleMissionsPressed), for: .touchUpInside)
        
        for slider in wishMakerView.stack.arrangedSubviews.compactMap({ $0 as? CustomSlider }) {
            slider.valueChanged = { [weak self] value in
                guard let self = self else { return }
                switch slider.titleView.text {
                case SliderConstants.red:
                    self.colorModel.red = Float(value)
                case SliderConstants.green:
                    self.colorModel.green = Float(value)
                case SliderConstants.blue:
                    self.colorModel.blue = Float(value)
                default: break
                }
                self.updateBackgroundColor()
                self.updateColorButtonTextLabel()
            }
        }
    }
    
    private func updateBackgroundColor() {
        view.backgroundColor = colorModel.uiColor
    }
    
    private func updateColorButtonTextLabel() {
        wishMakerView.addMoreWishesButton.setTitleColor(colorModel.uiColor, for: .normal)
        wishMakerView.scheduleWishesButton.setTitleColor(colorModel.uiColor, for: .normal)
    }
    
    // MARK: - Action Methods
    @objc private func toggleSliders() {
        let isHidden = wishMakerView.stack.isHidden
        wishMakerView.stack.isHidden = !isHidden
        let newTitle = isHidden ? ToggleConstants.toggleButtonTitleHide : ToggleConstants.toggleButtonTitleShow
        wishMakerView.toggleButton.setTitle(newTitle, for: .normal)
    }
    
    @objc private func addMoreWishesPressed() {
        let wishStoringViewController = WishStoringViewController()
        present(wishStoringViewController, animated: true)
    }
    
    @objc private func scheduleMissionsPressed() {
        let vc = WishCalendarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
