//
//  Heading.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 03.11.2024.
//


import UIKit

final class Heading: UIView {
    // MARK: - Properties
    private let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = HeadingConstants.titleText
        label.font = HeadingConstants.titleFont
        return label
    }()
    
    private let descriptionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = HeadingConstants.descriptionText
        label.font = HeadingConstants.descriptionFont
        label.numberOfLines = HeadingConstants.descriptionNumberOfLines
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
        
        titleView.pinLeft(to: leadingAnchor, HeadingConstants.titleLeadingOffset)
        titleView.pinTop(to: topAnchor, HeadingConstants.titleTopOffset)
        
        descriptionView.pinLeft(to: leadingAnchor, HeadingConstants.descriptionLeadingOffset)
        descriptionView.pinTop(to: titleView.bottomAnchor, HeadingConstants.descriptionTopOffset)
        descriptionView.pinRight(to: trailingAnchor, -1 * HeadingConstants.descriptionTrailingOffset)
    }
}
