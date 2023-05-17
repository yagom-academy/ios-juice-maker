//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var fruitInventory: [Fruit: Int]
    
    init(fruitInventory: [Fruit : Int]) {
        self.fruitInventory = fruitInventory
    }
    
    func readCurrentStock(for fruit: Fruit) -> Int {
        guard let currentAmount = fruitInventory[fruit] else {
            return 0
        }
        return currentAmount
    }
    
    func isStockSufficient(_ fruit: Fruit, with requiredAmount: Int) throws {
        let currentStock = readCurrentStock(for: fruit)
        guard currentStock >= requiredAmount else {
            throw FruitStoreError.insufficientFruit
        }
    }
    
    func decreaseFruitStock(_ fruit: Fruit, by amount: Int) {
        let currentAmount = readCurrentStock(for: fruit)
        fruitInventory[fruit] = currentAmount - amount
    }
    
    func increaseFruitStock(_ fruit: Fruit, by amount: Int) {
        let currentAmount = readCurrentStock(for: fruit)
        fruitInventory[fruit] = currentAmount + amount
    }
}
