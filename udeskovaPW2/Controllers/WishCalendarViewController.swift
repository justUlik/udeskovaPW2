//
//  WishCalendarViewController.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 30.11.2024.
//
import UIKit

final class WishCalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Сalendar view"
        label.textAlignment = .center
        label.frame = view.bounds
        view.addSubview(label)
    }
}
