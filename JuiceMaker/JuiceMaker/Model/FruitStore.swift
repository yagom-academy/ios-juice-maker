//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

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
    
    func fillFruit(_ fruit: Fruit, quantity: Int) throws {
        fruitBox[fruit] = try countQuantity(fruit: fruit) + quantity
    }
    
    func unSafeUseFruit(_ fruit: Fruit, quantity: Int) throws {
        fruitBox[fruit] = try countQuantity(fruit: fruit) - quantity
    }
    
    func verifyTheFruitExistsEnough(fruit: Fruit, quantity: Int) throws {
        if try countQuantity(fruit: fruit) < quantity {
            throw FruitStoreError.insufficientFruits
        }
    }
}
