//
//  WishCalendarHeading.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

final class WishCalendarHeading: UIView {
    // MARK: - Properties
    private let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = WishCalendarHeadingConstants.titleText
        label.font = WishCalendarHeadingConstants.titleFont
        return label
    }()
    
    private let descriptionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = WishCalendarHeadingConstants.descriptionText
        label.font = WishCalendarHeadingConstants.descriptionFont
        label.numberOfLines = WishCalendarHeadingConstants.descriptionNumberOfLines
        return label
    }()

    // MARK: - Lifecycle methods
    init() {
        super.init(frame: .zero)
        configureViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureViews() {
        for view in [titleView, descriptionView] {
            addSubview(view)
        }
        
        titleView.pinLeft(to: leadingAnchor, WishCalendarHeadingConstants.titleLeadingOffset)
        titleView.pinTop(to: topAnchor, WishCalendarHeadingConstants.titleTopOffset)
        
        descriptionView.pinLeft(to: leadingAnchor, WishCalendarHeadingConstants.descriptionLeadingOffset)
        descriptionView.pinTop(to: titleView.bottomAnchor, WishCalendarHeadingConstants.descriptionTopOffset)
        descriptionView.pinRight(to: trailingAnchor, -1 * WishCalendarHeadingConstants.descriptionTrailingOffset)
    }
}
