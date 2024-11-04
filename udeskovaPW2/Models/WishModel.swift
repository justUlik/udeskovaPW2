//
//  WishModel.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//

import Foundation


struct WishModel {
    // MARK: - Fields
    private let defaults = UserDefaults.standard
    private let wishesKey = "wishesKey"

    // MARK: - Properties
    var wishes: [String] {
        get {
            return defaults.array(forKey: wishesKey) as? [String] ?? []
        }
        set {
            defaults.set(newValue, forKey: wishesKey)
        }
    }

    // MARK: - Public methods
    mutating func addWish(_ wish: String) {
        var currentWishes = wishes
        currentWishes.append(wish)
        wishes = currentWishes
    }
    
    mutating func removeWish(at index: Int) {
        var currentWishes = wishes
        currentWishes.remove(at: index)
        wishes = currentWishes
    }
}
