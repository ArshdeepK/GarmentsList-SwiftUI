//
//  ItemListView.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import SwiftUI
import SwiftData

/// This struct represents Items List view for showing the list of items as per the sort order supplied.
/// This struct also represents No List View for showing No Items Available message if no items exist.
struct ItemListView: View {
    
    // MARK: Properties
    @Bindable private var viewModel: ViewModel

    // MARK: View
    var body: some View {
        NavigationStack {
            if viewModel.showItems {
                List {
                    ForEach(viewModel.items) { item in
                        Text("\(item.name)")
                            .font(.headline)
                    }
                }
            } else {
                NoListView()
            }
        }.onAppear() {
            viewModel.fetchItems()
        }
    }
 
    // MARK: Initializer
    init(modelContext: ModelContext, sortItemsBy sortOrder: SortDescriptor<Item>) {
        let viewModel = ViewModel(modelContext: modelContext, sortItemsBy: sortOrder)
        self.viewModel = viewModel
    }
}

#Preview {
    let container = ModelContainer.preview()
    return ItemListView(modelContext: container.mainContext, sortItemsBy: SortBy.alpha)
}
