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
    
    func decreaseStock(fruit: Fruit) {
        guard let stock = fruitStock[fruit] else { return }
        if stock < 1 {
            fruitStock[fruit] = 0
        } else {
            fruitStock[fruit] = stock - 1
        }
    }
    
    func usingStock(fruit: Fruit, needs: Int) {
        guard let stock = fruitStock[fruit] else { return }
        if stock < needs {
            print("재고가 부족합니다. 재고를 추가할까요?")

        } else {
            fruitStock[fruit] = stock - needs
        }
    }
}
