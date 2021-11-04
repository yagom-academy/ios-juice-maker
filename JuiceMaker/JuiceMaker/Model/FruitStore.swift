//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case bananna
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    private var inventory: Inventory
    
    init(fruitList: [Fruit], amount: Int) {
        inventory = Inventory(fruitList: fruitList, amount: amount)
    }
    
    func reduceInventory(ingredientsOf recipe: JuiceRecipe) {
        for ingredient in recipe.ingredients {
            inventory.reduceStock(of: ingredient.fruit, by: ingredient.amount)
        }
    }
    
    func canProvideIngredients(of juiceRecipe: JuiceRecipe) -> Bool {
        for ingredient in juiceRecipe.ingredients {
            guard inventory.hasSufficientStock(of: ingredient) else { return false }
        }
        return true
    }
    
    func retrieveCurrentFruitStock() -> [Fruit:Int] {
        return inventory.retrieveCurrentFruitStock()
    }
    
    func increaseStock(of fruit: Fruit, by amount: Int) {
        inventory.increaseStock(of: fruit, by: amount)
    }
    
    func reduceStock(of fruit: Fruit, by amount: Int) {
        inventory.reduceStock(of: fruit, by: amount)
    }
}

extension FruitStore {
    private struct Inventory {
        private var stock: [Fruit:Int] = [:]
        
        init(fruitList: [Fruit], amount: Int) {
            for fruit in fruitList {
                increaseStock(of: fruit, by: amount)
            }
        }
        
        mutating func reduceStock(of fruit: Fruit, by amount: Int) {
            guard let remainingStock = stock[fruit] else {
                return
            }
            stock[fruit] = remainingStock - amount
            postNotification(changed: fruit, by: stock[fruit])
        }
        
        mutating func increaseStock(of fruit: Fruit, by amount: Int) {
            if let remainingStock = stock[fruit] {
                stock[fruit] = remainingStock + amount
            } else {
                stock[fruit] = amount
            }
            postNotification(changed: fruit, by: stock[fruit])
        }
        
        func hasSufficientStock(of ingredient: Ingredient) -> Bool {
            if let remainingStock = stock[ingredient.fruit], remainingStock >= ingredient.amount {
                return true
            }
            return false
        }
        
        private func postNotification(changed fruit: Fruit, by amount: Int?) {
            let changedStock = [fruit:amount]
            NotificationCenter.default.post(name: Notification.Name.stockChanged, object: nil, userInfo: changedStock as [AnyHashable : Any])
        }
        
        func retrieveCurrentFruitStock() -> [Fruit:Int] {
            return stock
        }
    }
}
