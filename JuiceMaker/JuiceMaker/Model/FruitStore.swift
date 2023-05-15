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
    
    private func readCurrentStock(for fruit: Fruit) throws -> Int {
        guard let currentAmount = fruitInventory[fruit] else {
            throw JuiceMakerError.invalidFruit
        }
        return currentAmount
    }
    
    func isStockSufficient(_ fruit: Fruit, with requiredAmount: Int) throws {
        let currentStock = try readCurrentStock(for: fruit)
        guard currentStock >= requiredAmount else {
            throw JuiceMakerError.insufficientFruit
        }
    }
    
    func decreaseFruitStock(_ fruit: Fruit, amount: Int) throws {
        let currentAmount = try readCurrentStock(for: fruit)
        fruitInventory[fruit] = currentAmount - amount
    }
    
    func increaseFruitStock(_ fruit: Fruit, amount: Int) throws {
        let currentAmount = try readCurrentStock(for: fruit)
        fruitInventory[fruit] = currentAmount + amount
    }
}
