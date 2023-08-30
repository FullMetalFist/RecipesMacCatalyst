//
//  ToolbarDelegate.swift
//  Recipes
//
//  Created by Michael Vilabrera on 8/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit

class ToolbarDelegate: NSObject {
    
    #if targetEnvironment(macCatalyst)
    var shareRecipe: NSSharingServicePickerToolbarItem?
    #endif
}

#if targetEnvironment(macCatalyst)
extension NSToolbarItem.Identifier {
    static let editRecipe = NSToolbarItem.Identifier("com.example.apple-samplecode.Recipes.editRecipe")
    static let toggleRecipeIsFavorite = NSToolbarItem.Identifier("com.example.apple-samplecode.Recipes.toggleRecipeIsFavorite")
    static let shareRecipe = NSToolbarItem.Identifier("com.example.apple-samplecode.Recipes.shareRecipe")
}

extension ToolbarDelegate: NSToolbarDelegate {
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        let identifiers: [NSToolbarItem.Identifier] = [
            .toggleSidebar,
            .flexibleSpace,
            .editRecipe,
            .toggleRecipeIsFavorite,
            .shareRecipe
        ]
        return identifiers
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return toolbarDefaultItemIdentifiers(toolbar)
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        
        var toolbarItem: NSToolbarItem?
        
        switch itemIdentifier {
        case .editRecipe:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            item.image = UIImage(systemName: "square.and.pencil")
            item.label = "Edit Recipe"
            item.action = #selector(RecipeDetailViewController.editRecipe(_:))
            item.target = nil
            toolbarItem = item
        case .toggleRecipeIsFavorite:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            item.image = UIImage(systemName: "heart")
            item.label = "Toggle Favorites"
            item.action = #selector(RecipeDetailViewController.toggleFavorite(_:))
            item.target = nil
            toolbarItem = item
        case .shareRecipe:
            toolbarItem = NSSharingServicePickerToolbarItem(itemIdentifier: itemIdentifier)
        default:
            toolbarItem = nil
        }
        
        return toolbarItem
    }
    
    func toolbarWillAddItem(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let item = userInfo["item"] as? NSSharingServicePickerToolbarItem else { return }
        
        if item.itemIdentifier == .shareRecipe {
            shareRecipe = item
        }
    }
}
#endif
