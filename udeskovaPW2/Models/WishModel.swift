//
//  WishModel.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 04.11.2024.
//


struct WishModel {
    var wishes: [String] = ["I wish to add cells to the table"]
    
    mutating func addWish(_ wish: String) {
        wishes.append(wish)
    }
    
    mutating func removeWish(at index: Int) {
        wishes.remove(at: index)
    }
}
