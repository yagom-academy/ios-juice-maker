//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var fruitInventory: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            fruitInventory[fruit] = 10
        }
    }
    
    func addFruitInventroy(fruit: Fruit, amount: Int) {
        guard let inventory = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = inventory + amount
    }
    func useFruitInventroy(fruit: Fruit, amount: Int) {
        guard let inventory = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = inventory - amount
    }
}
