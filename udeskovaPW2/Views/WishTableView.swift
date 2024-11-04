//
//  WishTableView.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import UIKit

final class WishTableView: UIView {
    let table: UITableView = UITableView(frame: .zero)
    let closeButton = UIButton(type: .system)
    
    weak var delegate: WishTableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureCloseButton()
        configureTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .systemGray6
    }
    
    private func configureCloseButton() {
        closeButton.setTitle(WishStoringConstants.closeText, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        addSubview(closeButton)
        closeButton.pinTop(to: safeAreaLayoutGuide.topAnchor, WishStoringConstants.topOffset)
        closeButton.pinRight(to: trailingAnchor, WishStoringConstants.rightOffset)
    }
    
    private func configureTable() {
        table.backgroundColor = .systemIndigo
        table.layer.cornerRadius = WishStoringConstants.tableCornerRadius
        table.separatorStyle = .none
        
        addSubview(table)
        table.pinTop(to: closeButton.bottomAnchor, WishStoringConstants.tableTopOffset)
        table.pinLeft(to: self, WishStoringConstants.tableLeftOffset)
        table.pinRight(to: self, WishStoringConstants.tableRightOffset)
        table.pinBottom(to: self, WishStoringConstants.tableBottomOffset)
    }

    @objc
    private func closeButtonPressed() {
        delegate?.closeButtonTapped()
    }
}
