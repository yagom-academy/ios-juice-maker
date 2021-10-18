//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: String, CustomStringConvertible, CaseIterable {
    case strawberry = "딸기"
    case bananna = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var description: String {
        return rawValue
    }
}

// 과일 저장소 타입
class FruitStore {
    var inventory: [Fruit:Int] = [:]
    
    init(fruits: [Fruit], amount: Int) {
        for fruit in fruits {
            inventory[fruit] = amount
        }
    }
    
    func isAvailable(fruit: Fruit, amount: Int) -> Bool {
        if let remainingStock = inventory[fruit], remainingStock >= amount {
            return true
        }
        return false
    }
    
    func changeInventory(_ fruit: Fruit, by amount: Int) {
        guard let remainingStock = inventory[fruit] else {
            return
        }
        inventory[fruit] = remainingStock - amount
    }
}
