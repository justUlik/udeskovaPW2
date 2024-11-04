//
//  WishStoringViewController.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    private var wishModel = WishModel()
    private let wishTableView = WishTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTableView()
    }
    
    private func configureView() {
        view.addSubview(wishTableView)
        wishTableView.delegate = self
        wishTableView.frame = view.bounds
        wishTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func configureTableView() {
        wishTableView.table.dataSource = self
        wishTableView.table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        wishTableView.table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
}

// MARK: - WishTableViewDelegate
extension WishStoringViewController: WishTableViewDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return WishStoringConstants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return wishModel.wishes.count
        case 1:
            return WishStoringConstants.numberRowsAddWishCell
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath) as! WrittenWishCell
            cell.configure(with: wishModel.wishes[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddWishCell.reuseId, for: indexPath) as! AddWishCell
            cell.addWish = { [weak self] newWish in
                guard let self = self else { return }
                self.wishModel.wishes.append(newWish)
                self.wishTableView.table.reloadData()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

