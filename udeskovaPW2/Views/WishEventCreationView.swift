//
//  WishEventCreationView.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

// MARK: - Protocols
protocol WishEventCreationViewDelegate: AnyObject {
    func didCreateNewEvent(_ event: WishEventModel)
}

// MARK: - View Controller
final class WishEventCreationView: UIViewController {
    
    // MARK: - Constants
    struct WishEventCreationViewConstants {
        static let textLabelCreation = "Enter Title"
        static let descriptionLabelCreation = "Enter Description"
        static let buttonLabelCreation = "Save Event"
        static let titleAlert = "Missing Information"
        static let descriptionAlert = "Please fill in all fields."
        static let errorAlertTitle = "Invalid Dates"
        static let errorAlertMessage = "End date must be after the start date."
        static let buttonAlert = "OK"
        static let titleFieldTopOffset: CGFloat = 16.0
        static let descriptionFieldTopOffset: CGFloat = 12.0
        static let datePickerTopOffset: CGFloat = 16.0
        static let saveButtonTopOffset: CGFloat = 24.0
        static let fieldHorizontalOffset: CGFloat = 16.0
    }
    
    // MARK: - Properties
    weak var delegate: WishEventCreationViewDelegate?
    
    // MARK: - UI Elements
    private let titleField: UITextField = {
        let textField = UITextField()
        textField.placeholder = WishEventCreationViewConstants.textLabelCreation
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let descriptionField: UITextField = {
        let textField = UITextField()
        textField.placeholder = WishEventCreationViewConstants.descriptionLabelCreation
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let startDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(WishEventCreationViewConstants.buttonLabelCreation, for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Methods
    @objc private func didTapSaveButton() {
        guard
            let title = titleField.text, !title.isEmpty,
            let description = descriptionField.text, !description.isEmpty
        else {
            showAlert(
                title: WishEventCreationViewConstants.titleAlert,
                message: WishEventCreationViewConstants.descriptionAlert
            )
            return
        }
        
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        
        if startDate >= endDate {
            showAlert(
                title: WishEventCreationViewConstants.errorAlertTitle,
                message: WishEventCreationViewConstants.errorAlertMessage
            )
            return
        }
        
        let newEvent = WishEventModel(
            title: title,
            description: description,
            startDate: startDate,
            endDate: endDate
        )
        
        delegate?.didCreateNewEvent(newEvent)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleField)
        view.addSubview(descriptionField)
        view.addSubview(startDatePicker)
        view.addSubview(endDatePicker)
        view.addSubview(saveButton)
        
        // Constraints
        titleField.pinTop(to: view.safeAreaLayoutGuide.topAnchor, WishEventCreationViewConstants.titleFieldTopOffset)
        titleField.pinHorizontal(to: view, WishEventCreationViewConstants.fieldHorizontalOffset)
        
        descriptionField.pinTop(to: titleField.bottomAnchor, WishEventCreationViewConstants.descriptionFieldTopOffset)
        descriptionField.pinHorizontal(to: view, WishEventCreationViewConstants.fieldHorizontalOffset)
        
        startDatePicker.pinTop(to: descriptionField.bottomAnchor, WishEventCreationViewConstants.datePickerTopOffset)
        startDatePicker.pinHorizontal(to: view, WishEventCreationViewConstants.fieldHorizontalOffset)
        
        endDatePicker.pinTop(to: startDatePicker.bottomAnchor, WishEventCreationViewConstants.datePickerTopOffset)
        endDatePicker.pinHorizontal(to: view, WishEventCreationViewConstants.fieldHorizontalOffset)
        
        saveButton.pinTop(to: endDatePicker.bottomAnchor, WishEventCreationViewConstants.saveButtonTopOffset)
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: WishEventCreationViewConstants.buttonAlert, style: .default, handler: nil)
        )
        present(alertController, animated: true)
    }
}

// MARK: - Extensions
private extension UIView {
    func pinTop(to anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    func pinHorizontal(to view: UIView, _ offset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -offset).isActive = true
    }
}
