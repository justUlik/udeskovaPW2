//
//  AddWishCell.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import UIKit

final class AddWishCell: UITableViewCell {
    // MARK: - Fields
    static let reuseId = "AddWishCell"

    private let wishTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = AddWishButtonConstants.buttonRadius
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Wish", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Properties
    var addWish: ((String) -> Void)?

    // MARK: - Lifecycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func configureUI() {
        selectionStyle = .none
        contentView.addSubview(wishTextView)
        contentView.addSubview(addButton)

        wishTextView.pinTop(to: contentView, AddWishCellConstants.wishTextViewTopInset)
        wishTextView.pinLeft(to: contentView, AddWishCellConstants.wishTextViewSideInset)
        wishTextView.pinRight(to: contentView, AddWishCellConstants.wishTextViewSideInset)
        wishTextView.setHeight(mode: .grOE, AddWishCellConstants.wishTextViewMinHeight)

        addButton.pinTop(to: wishTextView.bottomAnchor, AddWishCellConstants.addButtonTopInset)
        addButton.pinCenterX(to: contentView)
        addButton.pinBottom(to: contentView, AddWishCellConstants.addButtonBottomInset)
        addButton.setHeight(mode: .equal, AddWishCellConstants.addButtonHeight)

        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }

    // MARK: - Button Actions
    @objc
    private func addButtonPressed() {
        guard let text = wishTextView.text, !text.isEmpty else { return }
        addWish?(text)
        wishTextView.text = ""
    }
}
