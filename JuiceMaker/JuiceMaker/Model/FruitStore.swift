//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    var fruitBox: [Fruit: Int] = [:]

    init(fruits: [Fruit: Int]) {
        fruitBox = fruits
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
    
    func unsafeUseFruit(_ fruit: Fruit, quantity: Int) throws {
        fruitBox[fruit] = try countQuantity(fruit: fruit) - quantity
    }
    
    func verifyTheFruitExistsEnough(fruit: Fruit, quantity: Int) throws {
        if try countQuantity(fruit: fruit) < quantity {
            throw FruitStoreError.insufficientFruits
        }
    }
}
