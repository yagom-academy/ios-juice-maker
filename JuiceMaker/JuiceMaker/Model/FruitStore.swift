//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var inventory: Dictionary<Fruit, Int>
    
    init(initialStock: Int) {
        inventory = [:]
        for fruit in Fruit.allCases {
            self.inventory[fruit] = initialStock
        }
    }
}
