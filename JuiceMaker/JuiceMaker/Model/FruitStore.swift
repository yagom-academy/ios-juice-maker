//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class FruitStore {
    enum Fruit: Int, CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    private var fruits = [Fruit: Int]()
    
    init(initialStock: Int) {
        for fruit in Fruit.allCases {
            fruits[fruit] = initialStock
        }
    }
    
    func increase(fruit: Fruit, quantity: Int) {
        fruits[fruit]? += quantity
    }
    
    func decrease(fruit: Fruit, quantity: Int) {
        fruits[fruit]? -= quantity
    }
}
