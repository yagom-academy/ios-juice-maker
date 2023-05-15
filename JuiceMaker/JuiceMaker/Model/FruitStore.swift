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
    
    func isStockSufficient(_ fruit: Fruit, with requiredAmount: Int) throws -> Bool {
        let currentStock = try readCurrentStock(for: fruit)
        return currentStock >= requiredAmount
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

