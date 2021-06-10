//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

class FruitStore {
    let defaultStock: Int = 10
    var fruitStock: [Fruit:Int] = [:]
    
    enum Fruit: String, CaseIterable {
        case strawberry = "딸기"
        case banana = "바나나"
        case fineapple = "파인애플"
        case kiwi = "키위"
        case mango = "망고"
    }
    
    init() {
        for i in Fruit.allCases {
            fruitStock[i] = defaultStock
        }
        changeStock(fruit: Fruit.banana, amount: 5)
    }
    
    func changeStock(fruit: Fruit, amount: Int) {
        fruitStock[fruit] = amount
    }
}

