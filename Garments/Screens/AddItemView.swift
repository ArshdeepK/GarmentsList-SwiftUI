//
//  AddItemView.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import SwiftUI
import SwiftData

/// This struct represents Add Item view to add an item to the list.
struct AddItemView: View {

    // MARK: Properties
    @Bindable private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focused: Bool

    // MARK: View
    var body: some View {
        Form {
            TextField(Strings.itemName.localized, text: $viewModel.newItemName)
                .focused($focused)
                .onChange(of: viewModel.newItemName) { oldValue, newValue in
                    // Keep the save button disabled until user enters something in the item name textfield.
                        viewModel.saveDisabled = newValue.isEmpty
                }
        }
        .onAppear() {
            // The view focuses on the item name textfield as soon the view appears.
            self.focused = true
        }
        .navigationTitle(Strings.addItem.localized)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(Strings.save.localized) {
                    save()
                }.disabled(viewModel.saveDisabled)
            }
        }
    }
    
    // MARK: Initializer
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        self.viewModel = viewModel
    }
    
    // MARK: Actions
    func save() {
        // Save item in the database.
        viewModel.saveItem()
        
        // Pop the view to previous screen.
        self.dismiss()
    }
}

#Preview { 
    let container = ModelContainer.preview()
    return AddItemView(modelContext: container.mainContext)
}
