//
//  Item.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var creationDate: Date
    
    init(name: String, creationDate: Date) {
        self.name = name
        self.creationDate = creationDate
    }
}
