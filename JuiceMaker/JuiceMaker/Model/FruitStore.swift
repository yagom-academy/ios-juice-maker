//
//  JuiceMaker - FruitStore.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private let fruitInitialStock: Int = 10
    private(set) var fruitInventory: [Int]

    init() {
        fruitInventory = Array(repeating: fruitInitialStock,
                               count: FruitType.allCases.count)
    }
    
    func checkStock(fruit: FruitType, amount: Int) -> Bool {
        guard fruitInventory[fruit.rawValue] >= amount else {
            return false
        }
        
        return true
    }
    
    func addStock(fruit: FruitType, amount: Int) {
        fruitInventory[fruit.rawValue] += amount
    }
    
    func reduceStock(fruit: FruitType, amount: Int) {
        fruitInventory[fruit.rawValue] -= amount
    }
}
