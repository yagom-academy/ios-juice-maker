//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    var inventory: Dictionary<Fruit, Int>
    
    init(defaultValue: Int = 10) {
        self.inventory = [:]
        Fruit.allCases.forEach {
            inventory.updateValue(defaultValue, forKey: $0)
        }
    }
    
    func increaseFruitStock(fruit: Fruit) {
        guard let fruitStock = inventory[fruit] else {
            return
        }
        inventory[fruit] = fruitStock + 1
    }
    
    func decreaseFruitStock(fruit: Fruit, quantity: Int = 1) throws {
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
