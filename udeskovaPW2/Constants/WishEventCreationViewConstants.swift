//
//  WishEventCreationViewConstants.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

enum WishEventCreationViewConstants {
    static let noDataLabel: String = "No wishes yet"
    static let noDataLabelFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    static let noDataLabelColor: UIColor = .gray
    static let viewBackgroundColor: UIColor = .white
    static let textLabelCreation: String = "Add event title"
    static let descriptionLabelCreation: String = "Add event description"
    static let buttonLabelCreation: String = "Create!"
    
    static let titleFieldTopOffset: CGFloat = 16
    static let fieldHorizontalOffset: CGFloat = 16
    static let descriptionFieldTopOffset: CGFloat = 16
    static let saveButtonTopOffset: CGFloat = 32
    
    static let titleAlert: String = "Missing Information"
    static let descriptionAlert: String = "Please enter both a title and a description for the event."
    static let buttonAlert: String = "OK"
}
