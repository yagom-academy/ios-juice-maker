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
    
    public init() {
        for fruit in Fruit.allCases {
            increaseStock(fruit: fruit, count: 10)
        }
    }
    
    public func increaseStock(fruit: Fruit, count: Int) {
        guard let stock = fruitStock[fruit] else { return }
        fruitStock[fruit] = stock + count
    }
    
    public func usingFruits(fruit: Fruit, needs: Int) {
        guard let stock = fruitStock[fruit] else { return }
        if stock < needs {
            print("재고가 부족합니다. 재고를 추가할까요?")
        } else {
            fruitStock[fruit] = stock - needs
        }
    }
}
