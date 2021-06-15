//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    var fruitStocks: Dictionary<Fruit, Int>
    let emptyQuantity = 0
    
    init() {
        fruitStocks = [.strawberry:10, .banana:10, .pineapple:10, .kiwi:10, .mango:10]
    }
    
    func currentStock(_ fruit: Fruit) -> Int {
        guard let stock = fruitStocks[fruit] else {
            print("재고에 존재하지 않는 과일")
            return emptyQuantity
        }
        
        return stock
    }
    
    func changeStock(_ fruit: Fruit, _ changingQuantity: Int) {
        guard let stock = fruitStocks[fruit] else {
            print("재고에 존재하지 않는 과일")
            return
        }
        fruitStocks.updateValue(stock - changingQuantity, forKey: fruit)
        NotificationCenter.default.post(name: Notification.Name("updateUILabel"), object: nil, userInfo: ["과일종류":fruit])
    }
}
