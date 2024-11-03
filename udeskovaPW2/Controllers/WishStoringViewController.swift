//
//  WishStoringViewController.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    private let table: UITableView = UITableView(frame: .zero)
    private let closeButton = UIButton(type: .system)
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCloseButton()
        configureTable()
    }

    
    private func configureUI() {
        view.backgroundColor = .cyan
    }
    
    private func configureCloseButton() {
        closeButton.setTitle(WishStoringConstants.closeText, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        view.addSubview(closeButton)
        closeButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor, WishStoringConstants.topOffset)
        closeButton.pinRight(to: view.trailingAnchor, WishStoringConstants.rightOffset)
    }
    
    private func configureTable() {
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        view.addSubview(table)
        table.backgroundColor = .red
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = WishStoringConstants.tableCornerRadius
        table.pinTop(to: closeButton.bottomAnchor, WishStoringConstants.tableTopOffset)
        table.pinLeft(to: view, WishStoringConstants.tableLeftOffset)
        table.pinRight(to: view, WishStoringConstants.tableRightOffset)
        table.pinBottom(to: view, WishStoringConstants.tableBottomOffset)
    }

    @objc
    private func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath) as! WrittenWishCell
        cell.configure(with: wishArray[indexPath.row])
        return cell
    }

}
