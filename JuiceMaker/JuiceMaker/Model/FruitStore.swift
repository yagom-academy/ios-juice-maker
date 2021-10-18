//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitBasket: [Fruit: Int]
    
    init(count: Int = 10) {
        let allFruits = Fruit.allCases
        let fruitscount = Array(repeating: count, count: allFruits.count)
        
        self.fruitBasket = Dictionary(uniqueKeysWithValues: zip(allFruits, fruitscount))
    }
    
    func changeAmount(count: Int, of fruit: Fruit, by calculator: (Int, Int) -> Int) throws {
        guard count > 0 else {
            throw RequestError.wrongCount
        }
        guard let oldFruitCount = fruitBasket[fruit] else {
            throw RequestError.fruitNotFound
        }
        guard count <= oldFruitCount else {
            throw RequestError.fruitStockOut
        }
        let newFruitCount = calculator(oldFruitCount, count)
        fruitBasket[fruit] = newFruitCount
    }
}


