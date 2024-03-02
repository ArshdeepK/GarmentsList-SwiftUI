//
//  StringExtension.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import Foundation

extension String {
    
    // The localized string for the key represented in `self`.
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    // Returns `self` by trimming whitespaces and new lines
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

