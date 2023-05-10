//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitInventory: [Fruit: Int] = Dictionary<Fruit, Int>()
    
    init(stock: Int = 10) {
        Fruit.allCases.forEach {
            fruitInventory[$0] = stock
        }
    }
    
    func update(_ fruit: Fruit, by quantity: Int) throws {
        guard let currentStock = fruitInventory[fruit],
              currentStock + quantity >= 0 else { throw FruitStoreError.insufficientError }
        fruitInventory[fruit] = currentStock + quantity
    }
    
    func getCurrentStock(of fruit: Fruit) -> Int {
        guard let currentStock = fruitInventory[fruit] else { return 0 }
        return currentStock
    }
}
