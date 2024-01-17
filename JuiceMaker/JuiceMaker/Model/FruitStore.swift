//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitBox: [Fruit: Int] = [:]

    init(baseQuantity: Int) {
        for fruit in Fruit.allCases {
            fruitBox[fruit] = baseQuantity
        }
    }
    
    private func countQuantity(fruit: Fruit) throws -> Int {
        guard let numberOfFruit = fruitBox[fruit] else {
            throw FruitStoreError.fruitNotFound
        }
        
        return numberOfFruit
    }
    
    func fill(fruit: Fruit, quantity: Int) throws {
        fruitBox[fruit] = try countQuantity(fruit: fruit) + quantity
    }
    
    func use(fruit: Fruit, quantity: Int) throws {
        try hasEnough(fruit: fruit, quantity: quantity)
        fruitBox[fruit] = try countQuantity(fruit: fruit) - quantity
    }
    
    func hasEnough(fruit: Fruit, quantity: Int) throws {
        if try countQuantity(fruit: fruit) < quantity {
            throw FruitStoreError.insufficientFruits
        }
    }
}
