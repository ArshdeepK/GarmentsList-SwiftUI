//
//  GarmentsTests.swift
//  GarmentsTests
//
//  Created by Arshdeep on 25/02/24.
//

import XCTest
import SwiftData
@testable import Garments

final class GarmentsTests: XCTestCase {
    var container: ModelContainer?
    
    @MainActor override func setUpWithError() throws {
        container = ModelContainer.preview()
    }

    override func tearDownWithError() throws {
        container = nil
    }
    
    @MainActor func testAppStartsEmpty() throws {
        if let container {
            let itemListViewModel = ItemListView.ViewModel(modelContext: container.mainContext)
            XCTAssertEqual(itemListViewModel.items.count, 0, "There should be 0 items when the app is first launched.")
        }
    }
    
    @MainActor func testCreatingSampleItemWorks() throws {
        if let container {
            let addItemViewModel = AddItemView.ViewModel(modelContext: container.mainContext)
            addItemViewModel.newItemName = "Test Item 1"
            addItemViewModel.saveItem()
            
            let itemListViewModel = ItemListView.ViewModel(modelContext: container.mainContext)
            XCTAssertEqual(itemListViewModel.items.count, 1, "There should be 1 item after adding sample item.")
        }
    }
    
    @MainActor func testFetchAllItems() throws {
        if let container {
            let addItemViewModel = AddItemView.ViewModel(modelContext: container.mainContext)
            addItemViewModel.newItemName = "Test Item 1"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Test Item 2"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Test Item 3"
            addItemViewModel.saveItem()
            
            let itemListViewModel = ItemListView.ViewModel(modelContext: container.mainContext)
            XCTAssertEqual(itemListViewModel.items.count, 3)
        }
    }
    
    @MainActor func testSortItemsByName() throws {//Sort Alphabetically
        if let container {
            let addItemViewModel = AddItemView.ViewModel(modelContext: container.mainContext)
            addItemViewModel.newItemName = "Tunic"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Dress"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Shirt"
            addItemViewModel.saveItem()
            
            let itemListViewModel = ItemListView.ViewModel(modelContext: container.mainContext, sortItemsBy: SortBy.alpha)
            XCTAssertEqual(itemListViewModel.items[0].name, "Dress")
            XCTAssertEqual(itemListViewModel.items[1].name, "Shirt")
            XCTAssertEqual(itemListViewModel.items[2].name, "Tunic")
        }
    }
    
    @MainActor func testSortItemsByCreationDate() throws {//Sort Latest Items Added on Top
        if let container {
            let addItemViewModel = AddItemView.ViewModel(modelContext: container.mainContext)
            addItemViewModel.newItemName = "Tunic"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Dress"
            addItemViewModel.saveItem()
            
            addItemViewModel.newItemName = "Shirt"
            addItemViewModel.saveItem()
            
            let itemListViewModel = ItemListView.ViewModel(modelContext: container.mainContext, sortItemsBy: SortBy.creationTime)
            XCTAssertEqual(itemListViewModel.items[0].name, "Shirt")
            XCTAssertEqual(itemListViewModel.items[1].name, "Dress")
            XCTAssertEqual(itemListViewModel.items[2].name, "Tunic")
        }
    }
}
