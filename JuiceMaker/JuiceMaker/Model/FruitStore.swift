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
}

class FruitStore {
    private var fruitStock = [Fruit: Int]()
    static let sharedInstance = FruitStore.init()
    
    private init() {
        for fruit in Fruit.allCases {
            increaseStock(fruit: fruit, count: 10)
        }
    }
  
    func stockAmount(fruit: Fruit) -> Int {
        return fruitStock[fruit] ?? 0
    }
    
    func increaseStock(fruit: Fruit, count: Int) {
        let stock = fruitStock[fruit] ?? 0
        fruitStock[fruit] = stock + count
    }
    
    func decreaseStock(fruit: Fruit, count: Int) {
        let stock = fruitStock[fruit] ?? 0
        if stock >= count {
            fruitStock[fruit] = stock - count
        }
    }
    
    func inputStock(fruit: Fruit, count: Int) {
        fruitStock[fruit] = count
    }

    func usingFruits(fruit: Fruit, needs: Int) throws {
        guard let stock = fruitStock[fruit] else { return }
        if stock < needs {
            throw FruitError.outOfStock
        } else {
            fruitStock[fruit] = stock - needs
        }
    }
    
    func usingFruits(fruit1: Fruit, needs1: Int, fruit2: Fruit, needs2: Int) throws {
        guard let stock1 = fruitStock[fruit1], let stock2 = fruitStock[fruit2] else { return }
        if stock1 >= needs1 && stock2 >= needs2 {
            fruitStock[fruit1] = stock1 - needs1
            fruitStock[fruit2] = stock2 - needs2
        } else {
            throw FruitError.outOfStock
        }
    }
}
