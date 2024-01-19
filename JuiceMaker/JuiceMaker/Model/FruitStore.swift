//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitBox: [Fruit: Int] = [:]

    init(strawberryQuantity: Int,
         bananaQuantity: Int,
         pineappleQuantity: Int,
         kiwiQuantity: Int,
         mangoQuantity: Int) {
        let quantityArray = [strawberryQuantity, bananaQuantity, pineappleQuantity, kiwiQuantity, mangoQuantity]
        
        for (index, fruit) in Fruit.allCases.enumerated() {
            fruitBox[fruit] = quantityArray[index]
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
