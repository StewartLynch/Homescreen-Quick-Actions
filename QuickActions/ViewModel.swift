//
//  ViewModel.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-11.
//

import UIKit

class ViewModel: ObservableObject {
    @Published var items: [Item]  = []
    @Published var title: String = "My Stuff"
    @Published var selectedClassification: Item.Classification = .all
    @Published var filteredItems: [Item] = []
    @Published var selectedItems: [Item.Classification] = [.pet, .sport, .electronic]
    
    var selectedActions: [UIApplicationShortcutItem] {
        var selectedActions = [UIApplicationShortcutItem]()
        for item in selectedItems {
            if let action = QuickAction.allShortcutItems.first(where: {$0.type == item.rawValue}) {
                selectedActions.append(action)
            }
        }
        return selectedActions
    }
    init() {
        loadItems()
    }
    

    func loadItems() {
        items = Item.all.sorted(by: {$0.name < $1.name})
        filteredItems = items
    }
    
    
    func filter() {
        guard selectedClassification != .all else {
            title = "My Stuff"
            filteredItems = items
            return
        }
        filteredItems = items.filter { $0.classification == selectedClassification }
        title = "\(selectedClassification.rawValue.capitalized)"
    }
    
    func addQuickActions() {
        UIApplication.shared.shortcutItems = selectedActions
    }
    
    func selectFilter(for name: String) {
        if let classification = Item.Classification(rawValue: name) {
            selectedClassification = classification
            filter()
        }
    }

}
