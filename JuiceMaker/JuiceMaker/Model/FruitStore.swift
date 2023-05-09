//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func useValidStock(usedFruits: (fruit: Fruit, amount: Int)...) throws {
        for usedFruit in usedFruits {
            try checkStock(usedFruit: usedFruit)
            updateStock(usedFruit: usedFruit)
        }
    }
    
    private func checkStock(usedFruit: (fruit: Fruit, amount: Int)) throws {
        guard let currentAmount = fruitStock[usedFruit.fruit] else {
            throw FruitStoreError.notFoundKey(usedFruit.fruit)
        }
        
        if currentAmount < usedFruit.amount {
            throw FruitStoreError.notEnoughStock(usedFruit.fruit)
        }
    }
    
    private func updateStock(usedFruit: (fruit: Fruit, amount: Int)) {
        if let currentAmount = fruitStock[usedFruit.fruit] {
            fruitStock[usedFruit.fruit] = currentAmount - usedFruit.amount
        }
    }
}
