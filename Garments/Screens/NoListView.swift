//
//  NoListView.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import SwiftUI

/// This struct represents No List view to show no items available message.
struct NoListView: View {
    
    // MARK: View
    var body: some View {
        Text(Strings.noItems.localized)
        Spacer()
    }
}

#Preview {
    NoListView()
}
