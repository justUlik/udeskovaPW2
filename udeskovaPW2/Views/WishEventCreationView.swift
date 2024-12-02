//
//  WishEventCreationView.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

protocol WishEventCreationViewDelegate: AnyObject {
    func didCreateNewEvent(_ event: WishEventModel)
}

final class WishEventCreationView: UIViewController {
    // MARK: - Properties
    weak var delegate: WishEventCreationViewDelegate?
    
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
    
    // MARK: - Private methods
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleField)
        view.addSubview(descriptionField)
        view.addSubview(saveButton)
        
        titleField.pinTop(to: view.safeAreaLayoutGuide.topAnchor, WishEventCreationViewConstants.titleFieldTopOffset)
        titleField.pinHorizontal(to: view, WishEventCreationViewConstants.fieldHorizontalOffset)
        
        descriptionField.pinTop(to: titleField.bottomAnchor, WishEventCreationViewConstants.descriptionFieldTopOffset)
        descriptionField.pinHorizontal(to: view, WishEventCreationViewConstants.descriptionFieldTopOffset)
        
        saveButton.pinTop(to: descriptionField.bottomAnchor, WishEventCreationViewConstants.saveButtonTopOffset)
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc private func didTapSaveButton() {
        guard
            let title = titleField.text, !title.isEmpty,
            let description = descriptionField.text, !description.isEmpty
        else {
            let alertController = UIAlertController(
                title: WishEventCreationViewConstants.titleAlert,
                message: WishEventCreationViewConstants.descriptionAlert,
                preferredStyle: .alert
            )
            
            alertController.addAction(UIAlertAction(title: WishEventCreationViewConstants.buttonAlert, style: .default, handler: nil))
            
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        let newEvent = WishEventModel(
            title: title,
            description: description,
            startDate: WishCellConstants.startDate,
            endDate: WishCellConstants.endDate
        )
        
        delegate?.didCreateNewEvent(newEvent)
        dismiss(animated: true)
    }
}
