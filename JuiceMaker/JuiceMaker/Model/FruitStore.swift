//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// 과일 타입
class FruitStore {
    private var stock: Int = 10
    private let name: Fruits
    
    init(name: Fruits) {
        self.name = name
    }
    
    var stockLeft: Int {
        return stock
    }

    func updateStock(by number: Int) {
        stock = number
    }

    func consumeStock(of number: Int) {
        stock -= number
    }
    
    func hasMoreThan(requiredAmount: Int) -> Bool {
        if stock < requiredAmount {
            return false
        }
        return true
    }
}
