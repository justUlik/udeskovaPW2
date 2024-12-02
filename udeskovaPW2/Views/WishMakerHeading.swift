//
//  WishMakerHeading.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import UIKit

final class WishMakerHeading: UIView {
    // MARK: - Properties
    private let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = WishMakerHeadingConstants.titleText
        label.font = WishMakerHeadingConstants.titleFont
        return label
    }()
    
    private let descriptionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = WishMakerHeadingConstants.descriptionText
        label.font = WishMakerHeadingConstants.descriptionFont
        label.numberOfLines = WishMakerHeadingConstants.descriptionNumberOfLines
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
        
        titleView.pinLeft(to: leadingAnchor, WishMakerHeadingConstants.titleLeadingOffset)
        titleView.pinTop(to: topAnchor, WishMakerHeadingConstants.titleTopOffset)
        
        descriptionView.pinLeft(to: leadingAnchor, WishMakerHeadingConstants.descriptionLeadingOffset)
        descriptionView.pinTop(to: titleView.bottomAnchor, WishMakerHeadingConstants.descriptionTopOffset)
        descriptionView.pinRight(to: trailingAnchor, -1 * WishMakerHeadingConstants.descriptionTrailingOffset)
    }
}
