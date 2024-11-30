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
        
        // Add wish button action
        wishMakerView.addMoreWishesButton.addTarget(self, action: #selector(addMoreWishesPressed), for: .touchUpInside)
        
        // Schedule wish button action
        wishMakerView.scheduleWishesButton.addTarget(self, action: #selector(scheduleMissionsPressed), for: .touchUpInside)
        
        // Slider value change handlers
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
            }
        }
    }
    
    private func updateBackgroundColor() {
        view.backgroundColor = colorModel.uiColor
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
        let scheduleViewController = ScheduleViewController()
        present(scheduleViewController, animated: true)
    }
}
