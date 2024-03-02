//
//  HomeView.swift
//  Garments
//
//  Created by Arshdeep on 25/02/24.
//

import SwiftUI
import SwiftData

/// This struct represents the first view to be presented to the user.
/// The view constructs a segment to switch between items sorted as alphabetically or by latest date.
/// The view links to Items List view for showing the list of items as per the selected sort order.
/// The view has a toolbar with a plus button which navigates the user to Add Item view to add an item to the list.
struct HomeView: View {
    
    // MARK: Properties
    @Bindable private var viewModel: ViewModel

    // MARK: View
    var body: some View {
        NavigationStack {
            Picker("", selection: $viewModel.sortOrder) {
                Text(Strings.alpha.localized)
                    .tag(SortBy.alpha)
                Text(Strings.creationTime.localized)
                    .tag(SortBy.creationTime)
            }
            .pickerStyle(.segmented)
            .padding()
            ItemListView(modelContext: viewModel.modelContext, sortItemsBy: viewModel.sortOrder)
                .navigationTitle(Strings.items.localized)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { NavigationLink(destination: AddItemView(modelContext: viewModel.modelContext)) { Image(systemName: Images.plus) .foregroundColor(.black) } }
            }
        }
    }
    
    // MARK: Initializer
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        self.viewModel = viewModel
    }
}

#Preview {
    let container = ModelContainer.preview()
    return HomeView(modelContext: container.mainContext)
}
