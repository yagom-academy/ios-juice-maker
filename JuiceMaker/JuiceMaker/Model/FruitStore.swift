//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var inventory: Dictionary<Fruit, Int>
    
    init(inventory: Dictionary<Fruit, Int>) {
        self.inventory = inventory
    }
    
    init(initialStock: Int) {
        inventory = [:]
        for fruit in Fruit.allCases {
            inventory[fruit] = initialStock
        }
    }
    
    func increaseStock(of fruit: Fruit, by amount: Int) throws {
        guard amount > 0 else {
            throw FruitStoreError.invalidAmount
        }
        try _ = getCurrentStock(of: fruit)
        changeStock(of: fruit, by: amount)
    }
    
    func decreaseStock(of fruit: Fruit, by amount: Int) throws {
        guard amount > 0 else {
            throw FruitStoreError.invalidAmount
        }
        try checkInventoryHasStock(of: fruit, moreThan: amount)
        changeStock(of: fruit, by: -amount)
    }
    
    func changeStock(of fruit: Fruit, by amount: Int) {
        if let currentStock = inventory[fruit] {
            inventory[fruit] = currentStock + amount
        }
    }
    
    func checkStockOfIngredients(in recipe: [Juice.Ingredient]) throws {
        for ingredient in recipe {
            try checkInventoryHasStock(of: ingredient.fruit, moreThan: ingredient.amount)
        }
    }
    
    func checkInventoryHasStock(of fruit: Fruit, moreThan amount: Int) throws {
        let currentStock = try getCurrentStock(of: fruit)
        guard currentStock >= amount else {
            throw FruitStoreError.outOfStock
        }
    }
    
    func getCurrentStock(of fruit: Fruit) throws -> Int {
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.notInFruitList
        }
        return currentStock
    }
}
