//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitInventory: [Fruit: Int]
    
    init(fruitInventory: [Fruit: Int]) {
        self.fruitInventory = fruitInventory
    }
    
    func getCurrentStock(of fruit: Fruit) -> Int? {
        guard let currentStock = fruitInventory[fruit] else { return nil }
        return currentStock
    }
    
    func checkStock(of fruit: Fruit, for amount: Int) -> Bool {
        guard let currentStock = fruitInventory[fruit],
              currentStock >= amount else { return false }
        return true
    }
    
    func changeStock(of fruit: Fruit, by quantity: Int) {
        guard let currentStock = fruitInventory[fruit] else { return }
        fruitInventory[fruit] = currentStock + quantity
    }
    
    func updateStock(of fruit: Fruit, to quantity: Int) {
        fruitInventory[fruit] = quantity
    }
}
