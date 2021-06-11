//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable{
    case strawberry, banana, pineapple, kiwi, mango
}

enum FruitError: Error {
    case outOfStock
    case outOfStockWhenMakeFruits
}

class FruitStore {
    var fruitStock = [Fruit: Int]()
    
    init() {
        for fruit in Fruit.allCases {
            fruitStock[fruit] = 10
        }
    }
    
    func increaseStock(fruit: Fruit) {
        guard let stock = fruitStock[fruit] else { return }
        fruitStock[fruit] = stock + 1
    }
//
//    func decreaseStock(fruit: Fruit) throws {
//        guard let stock = fruitStock[fruit] else { return }
//        if stock < 1 {
//        }
//    }
    
    func usingFruits(fruit: Fruit, needs: Int) throws {
        guard let stock = fruitStock[fruit] else { return }
        if stock < needs {
            throw FruitError.outOfStock
        } else {
            fruitStock[fruit] = stock - needs
        }
    }
}
