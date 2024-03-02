//
//  Constants.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import Foundation

struct Strings {
    static let noItems =     "No Items Available"
    static let items =          "Items"
    static let addItem =        "Add Item"
    static let itemName =       "Item Name"
    static let save =           "Save"
    static let alpha =          "Alpha"
    static let creationTime =   "Creation Time"
}

struct Images {
    static let plus = "plus"
}

enum SortBy {
    static let alpha = SortDescriptor(\Item.name)
    static let creationTime = SortDescriptor(\Item.creationDate, order: .reverse)
}
