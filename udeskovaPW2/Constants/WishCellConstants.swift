//
//  WishCellConstants.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 01.12.2024.
//

import UIKit

enum WishCellConstants {
    static let defaultTitle: String = "New scheduled wish"
    static let defaultDescription: String = ""
    static let startDate: Date = Date.now
    static let endDate: Date = Date.now
    
    static let minimumLineSpacing: CGFloat = 10
    static let minimumInteritemSpacing: CGFloat = 10
    static let collectionViewBackgroungColor: UIColor = UIColor(_colorLiteralRed: 254/255, green: 255/255, blue: 254/255, alpha: 1)
    
    static let collectionViewMargin: CGFloat = .zero
    static let cellHeightSize: CGFloat = 100
    static let cellWidthMargin: CGFloat = 20
    
    static let titleLabelFontSize: CGFloat = 16
    static let descriptionLabelFontSize: CGFloat = 14
    static let dateLabelFontSize: CGFloat = 12
    static let dateFormat = "dd.MM.yyyy hh:mm"
    static let spacing: CGFloat = 8
    static let horizontalPadding: CGFloat = 16
    static let verticalPadding: CGFloat = 16
    static let cornerRadius: CGFloat = 10
    static let backgroundColor = UIColor(red: 244/255, green: 255/255, blue: 194/255, alpha: 1)
    
    static let cellHeadingNumberOfLines: Int = 1
    static let celldescriptionHeadingNumberOfLines: Int = 2
    static let cellDateNumberOfLines: Int = 1
}
