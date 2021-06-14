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
    
    private(set) var fruits = [Fruit: Int]()
    
    init(initialStock: Int) {
        for fruit in Fruit.allCases {
            fruits[fruit] = initialStock
        }
    }
    
    func increase(fruit: Fruit, quantity: Int) {
        guard var fruits = fruits[fruit] else { return }
        fruits += quantity
    }
    
    func decrease(fruits: [Fruit: Int]) {
        for fruit in fruits {
            guard var fruits = self.fruits[fruit.key] else { return }
            fruits -= fruit.value
        }
    }
}
