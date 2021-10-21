//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore: FruitStorage {
    private var inventory: [Fruit: Int] = [:]
    
    init(fruitQuantity: Int = 10) {
        Fruit.allCases.forEach { fruit in
            inventory.updateValue(fruitQuantity, forKey: fruit)
        }
    }
    
    init(inventory: [Fruit: Int]) {
        self.inventory = inventory
    }
    
    func changeFruitStock(of fruit: Fruit, by quantity: Int = 1, calculate: (Int, Int) -> Int) throws {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        if calculate(fruitStock, quantity) < 0 {
            throw FruitStoreError.stockShortage
        }
        inventory[fruit] = calculate(fruitStock, quantity)
    }
    
    func currentFruitStock(of fruit: Fruit) throws -> Int {
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        return currentStock
    }
}
