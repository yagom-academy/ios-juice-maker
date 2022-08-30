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
        guard inventory[fruit] != nil else {
            throw FruitStoreError.notInFruitList
        }
        changeStock(of: fruit, amount: amount)
    }
    
    func subtract(amount: Int, of fruit: Fruit) throws {
        guard amount > 0 else {
            throw FruitStoreError.wrongAmount
        }
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.notInFruitList
        }
        guard currentStock >= amount else {
            throw FruitStoreError.outOfStock
        }
        changeStock(of: fruit, amount: -amount)
    }
    
    func changeStock(of fruit: Fruit, amount: Int) {
        if let currentStock = inventory[fruit] {
            inventory[fruit] = currentStock + amount
        }
    }
    
    func checkStockOfFruits(in recipe: [Juice.Material]) throws {
        for material in recipe {
            guard let currentStock = inventory[material.fruit] else {
                throw FruitStoreError.notInFruitList
            }
            guard currentStock >= material.amount else {
                throw FruitStoreError.outOfStock
            }
        }
    }
    
}
