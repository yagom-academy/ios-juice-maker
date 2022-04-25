//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: Int] = [:]
    
    func subtractQuantity(fruit: Fruit, by number: Int) {
        guard let quantity = fruitStock[fruit] else {
            return
        }
        
        fruitStock[fruit] = quantity - number
    }
    
    init(quantity: Int) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(quantity, forKey: fruit)
        }
    }
}


