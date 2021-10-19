//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var stock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func checkEnoughStock(of fruit: Fruit, requiredAmount: Int) -> Bool {
        guard let fruitCounts = stock[fruit], fruitCounts >= requiredAmount else {
            return false
        }
        
        return true
    }
}
