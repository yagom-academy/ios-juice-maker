//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private(set) var inventory: Dictionary<Fruit, Int> = [:]
    
    init(inventory: Dictionary<Fruit, Int>) {
        self.inventory = inventory
    }
    
    init(initialStock: Int) {
        for fruit in Fruit.allCases {
            inventory[fruit] = initialStock
        }
    }
    
    func add(amount: Int, of fruit: Fruit) throws {
        guard amount > 0 else {
            throw FruitStoreError.wrongAmount
        }
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.notInFruitList
        }
        inventory[fruit] = currentStock + amount
    }
    
    func subtract(amount: Int, of fruit: Fruit) throws {
        guard amount > 0 else {
            throw FruitStoreError.wrongAmount
        }
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.notInFruitList
        }
        inventory[fruit] = currentStock - amount
    }
    
    func canSubtract(amount: Int, of fruit: Fruit) -> Bool {
        guard let currentStock = inventory[fruit], currentStock >= amount else {
            return false
        }
        return true
    }
}
