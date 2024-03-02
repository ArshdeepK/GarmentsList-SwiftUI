//
//  ItemListView-ViewModel.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import Foundation
import SwiftUI
import SwiftData

extension ItemListView {
    
    /// This view model observes the properties to be used for the Item List view.
    /// Also, fetches the items from the database.
    @Observable
       class ViewModel {
           
           // MARK: Properties
           let modelContext: ModelContext
           let sortOrder: SortDescriptor<Item>?
           var items: [Item] = []
           var showItems: Bool {
               // Show items if items exist.
               return !items.isEmpty
           }
           
           // MARK: Initializer
           init(modelContext: ModelContext, sortItemsBy sortOrder: SortDescriptor<Item>? = nil) {
               self.modelContext = modelContext
               self.sortOrder = sortOrder
               self.fetchItems()
           }
           
           // MARK: Fetch from DB
           func fetchItems() {
               var fetchDescriptor: FetchDescriptor<Item>
               if let sortOrder {
                   fetchDescriptor = FetchDescriptor<Item>(sortBy: [sortOrder])
               } else {
                   fetchDescriptor = FetchDescriptor<Item>()
               }
               
               do {
                   let items = try modelContext.fetch(fetchDescriptor)
                   self.items = items
               } catch {
                   print("Failed to load Items model.")
               }
           }
           
          
       }
}
