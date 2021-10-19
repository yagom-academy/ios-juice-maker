//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    private var inventory: [Fruit: Int]
    
    init(defaultValue: Int = 10) {
        self.inventory = [:]
        Fruit.allCases.forEach {
            inventory.updateValue(defaultValue, forKey: $0)
        }
    }
    
    func increaseFruitStock(of fruit: Fruit, by quantity: Int = 1) {
        guard let fruitStock = inventory[fruit] else {
            return
        }
        inventory[fruit] = fruitStock + quantity
    }
    
    func decreaseFruitStock(of fruit: Fruit, by quantity: Int = 1) throws {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.unexpectedNil
        }
        if fruitStock < quantity {
            throw FruitStoreError.stockShortage
        }
        inventory[fruit] = fruitStock - quantity
    }
    
}

enum FruitStoreError: Error {
    case stockShortage
    case unexpectedNil
}
