//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func checkStock(fruit: Fruit, by count: Int) throws {
        guard let currentAmount = fruitStock[fruit] else {
            throw FruitStoreError.notFoundKey
        }
        
        if currentAmount < count {
            throw FruitStoreError.notEnoughStock(fruit)
        }
    }
}

enum FruitStoreError: Error {
    case notFoundKey, notEnoughStock(FruitStore.Fruit)
}
