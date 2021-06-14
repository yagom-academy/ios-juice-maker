//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    var fruitStocks: Dictionary<Fruit, Int>
    
    init() {
        fruitStocks = [.strawberry:10, .banana:10, .pineapple:10, .kiwi:10, .mango:10]
    }
    
    func currentStock(_ fruit: Fruit) -> Int {
        guard let stock = fruitStocks[fruit] else {
            print("재고에 존재하지 않는 과일")
            return
        }
        
        return stock
    }
    
    func changeStock(_ fruit: Fruit, _ changingQuantity: Int) {
        guard let stock = fruitStocks[fruit] else {
            print("재고에 존재하지 않는 과일")
            return
        }
        
        fruitStocks.updateValue(stock - changingQuantity, forKey: fruit)
    }
}
