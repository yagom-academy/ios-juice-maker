//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit : Int]
    
    init(defaultStock: Int = 10) {
        fruitStock = [.strawberry : defaultStock,
                      .banana : defaultStock,
                      .kiwi : defaultStock,
                      .mango : defaultStock,
                      .pineapple : defaultStock]
    }
    
    func addFruits(fruit: Fruit, amount: Int) {
        guard var fruitAmount = fruitStock[fruit] else {
            return
        }
        
        fruitAmount += amount
        fruitStock[fruit] = fruitAmount
    }
    
    func substractFruits(fruit: Fruit, amount: Int) {
        guard var fruitAmount = fruitStock[fruit] else {
            return
        }
        
        fruitAmount -= amount
        fruitStock[fruit] = fruitAmount
    }
    
}
