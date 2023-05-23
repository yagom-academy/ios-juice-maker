//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitInventory: [Fruit: Int]
    
    init(fruitInventory: [Fruit : Int]) {
        self.fruitInventory = fruitInventory
    }
    
    func readFruitInventory() -> [Fruit: Int] {
        return fruitInventory
    }
    
    func isStockSufficient(_ fruit: Fruit, with requiredAmount: Int) throws {
        guard let currentStock = fruitInventory[fruit],
              currentStock >= requiredAmount else {
            throw FruitStoreError.insufficientFruit
        }
    }
    
    func decreaseFruitStock(_ fruit: Fruit, by amount: Int) {
        guard let currentStock = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = currentStock - amount
    }
}
