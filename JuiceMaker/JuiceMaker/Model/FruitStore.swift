//
//  JuiceMaker - FruitStore.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private(set) var fruitInventory: [FruitType: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func checkStock(fruit: FruitType, amount: Int) -> Bool {
        guard let fruitStock = fruitInventory[fruit],
              fruitStock >= amount else {
            return false
        }
        return true
    }
    
    func addStock(fruit: FruitType, addCount: Int) {
        guard let fruitStock = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = fruitStock + addCount
    }
    
    func reduceStock(fruit: FruitType, reduceCount: Int) {
        guard let fruitStock = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = fruitStock - reduceCount
    }
}
