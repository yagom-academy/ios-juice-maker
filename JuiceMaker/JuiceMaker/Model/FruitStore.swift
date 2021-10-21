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
    
    func changeFruitStock(of fruit: Fruit, by quantity: Int = 1, calculate: (Int, Int) -> Int) throws {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.unexpectedNil
        }
        if calculate(fruitStock, quantity) < 0 {
            throw FruitStoreError.stockShortage
        }
        inventory[fruit] = calculate(fruitStock, quantity)
    }
}

enum FruitStoreError: Error {
    case stockShortage
    case unexpectedNil
}
