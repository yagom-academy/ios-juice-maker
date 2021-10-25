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
}

extension FruitStore {
    private struct Inventory {
        private var stock: [Fruit:Int] = [:]
        
        init(fruitList: [Fruit], amount: Int) {
            for fruit in fruitList {
                stock[fruit] = amount
            }
        }
        
        mutating func reduceStock(of fruit: Fruit, by amount: Int) {
            guard let remainingStock = stock[fruit] else {
                return
            }
            stock[fruit] = remainingStock - amount
        }
        
        func hasSufficientStock(of ingredient: Ingredient) -> Bool {
            if let remainingStock = stock[ingredient.fruit], remainingStock >= ingredient.amount {
                return true
            }
            return false
        }
    }
}
