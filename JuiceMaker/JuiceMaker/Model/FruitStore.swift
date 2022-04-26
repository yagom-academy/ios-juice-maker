//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: Int] = [:]
    
    func subtractQuantity(fruit: Fruit, by number: Int) throws {
        guard let quantity = fruitStock[fruit] else {
            return
        }
        
        if quantity < number {
            throw ThrowError.outOfStock
        }
        
        fruitStock[fruit] = quantity - number
    }
    
    func convertToString(fruit: Fruit) -> String {
        guard let stock = fruitStock[fruit] else {
            return "0"
        }
        
        return String(stock)
    }
    
    init(quantity: Int) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(quantity, forKey: fruit)
        }
    }
}


