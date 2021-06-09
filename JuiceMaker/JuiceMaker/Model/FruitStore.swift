//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable{
    case strawberry, banana, pineapple, kiwi, mango
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
}
