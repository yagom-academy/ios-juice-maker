//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private var fruitInventory: [Fruit: Int]
    
    init(fruitInventory: [Fruit : Int]) {
        self.fruitInventory = fruitInventory
    }
    
    mutating func increaseFruitStock(_ fruit: Fruit, amount: Int) throws {
        if let currentAmount = fruitInventory[fruit] {
            fruitInventory[fruit] = currentAmount + amount
        } else {
            throw JuiceMakerError.invalidFruit
        }
    }
    
    mutating func decreaseFruitStock(_ fruit: Fruit, amount: Int) throws {
        if let currentAmount = fruitInventory[fruit] {
            fruitInventory[fruit] = currentAmount - amount
        } else {
            throw JuiceMakerError.invalidFruit
        }
    }
    
    func readCurrentStock(for fruit: Fruit) throws -> Int {
        guard let currentAmount = fruitInventory[fruit] else {
            throw JuiceMakerError.invalidFruit
        }
        return currentAmount
    }
    
    func compareAmount(_ fruit: Fruit, with requiredAmount: Int) -> Bool {
        let currentStock = (try? readCurrentStock(for: fruit)) ?? 0
        if currentStock < requiredAmount {
            return false
        }
        return true
    }
}

