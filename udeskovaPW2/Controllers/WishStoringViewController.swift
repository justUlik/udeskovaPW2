//
//  WishStoringViewController.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCloseButton()
    }

    private func configureUI() {
        view.backgroundColor = .cyan
    }
    
    private func configureCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle(WishStoringConstants.closeText, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        view.addSubview(closeButton)
        closeButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor, WishStoringConstants.topOffset)
        closeButton.pinRight(to: view.trailingAnchor, WishStoringConstants.rightOffset)
    }

    @objc
    private func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
