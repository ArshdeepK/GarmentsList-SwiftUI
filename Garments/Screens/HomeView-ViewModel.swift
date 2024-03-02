//
//  HomeView-ViewModel.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import Foundation
import SwiftData

extension HomeView {
    
    /// This view model observes the properties to be used for the home view.
    @Observable
    class ViewModel {
        
        // MARK: Properties
        var sortOrder = SortBy.alpha
        let modelContext: ModelContext
        
        // MARK: Initializer
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
        }
    }
}
