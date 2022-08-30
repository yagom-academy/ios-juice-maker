//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var inventory: Dictionary<Fruit, Int>
    
    init(initialStock: Int) {
        self.inventory = [:]
        for fruit in Fruit.allCases {
            self.inventory[fruit] = initialStock
        }
    }
    
    func add(amount: Int, of fruit: Fruit) {
        if let currentStock = self.inventory[fruit] {
            self.inventory[fruit] = currentStock + amount
        }
    }
}
