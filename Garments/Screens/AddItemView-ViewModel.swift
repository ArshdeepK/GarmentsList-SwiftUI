//
//  AddItemView-ViewModel.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import SwiftUI
import SwiftData

extension AddItemView {
    
    /// This view model observes the properties to be used for the Add Item view.
    /// Also, lets the new item to save in to the database.
    @Observable
       class ViewModel {
           
           // MARK: Properties
           let modelContext: ModelContext
           var newItemName = ""
           var saveDisabled: Bool = true

           // MARK: Initializer
           init(modelContext: ModelContext) {
               self.modelContext = modelContext
           }

           // MARK: Save in DB
           func saveItem() {
               guard newItemName.isEmpty == false else { return }

               let item = Item(name: newItemName, creationDate: Date())
               modelContext.insert(item)
               newItemName = ""
           }
       }
}
