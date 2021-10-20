//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var inventory: [Fruit:Int] = [:]
    
    init(fruitList: [Fruit], amount: Int) {
        for fruit in fruitList {
            inventory[fruit] = amount
        }
    }
    
    func decreaseStock(of fruit: Fruit, by amount: Int) {
        guard let remainingStock = inventory[fruit] else {
            return
        }
        inventory[fruit] = remainingStock - amount
    }
    
    func isUnavailable(fruit: Fruit, requiredAmount: Int) -> Bool {
        if let remainingStock = inventory[fruit], remainingStock < requiredAmount {
            return true
        }
        return false
    }
}
