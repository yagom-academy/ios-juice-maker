//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


class FruitStore {
    private var inventory: [Fruit: Int] = [:]
    
    init(defaultValue: Int = 10) {
        Fruit.allCases.forEach {
            inventory.updateValue(defaultValue, forKey: $0)
        }
    }
    
    func changeFruitStock(of fruit: Fruit, by quantity: Int = 1, calculate: (Int, Int) -> Int) throws {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        if calculate(fruitStock, quantity) < 0 {
            throw FruitStoreError.stockShortage
        }
        inventory[fruit] = calculate(fruitStock, quantity)
    }
}
