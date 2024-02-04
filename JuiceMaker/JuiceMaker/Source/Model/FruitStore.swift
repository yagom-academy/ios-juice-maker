//
//  JuiceMaker - FruitStore.swift
//  Created by HAMZZI, Danny. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    private var fruitStorage: [Fruit: Int] = [:]
    
    private init() {
        self.fruitStorage = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    }
    
    func getCurrentFruitStorage() -> [Fruit: Int] {
        return fruitStorage
    }
    
    func getQuantity(of fruit: Fruit) -> Int {
        return fruitStorage[fruit] ?? 0
    }
    
    func updateStock(for fruit: Fruit, quantity: Int) {
        fruitStorage[fruit] = quantity
    }
    
    func checkFruitAvailability(fruitsStock: [Fruit: Int], amount: Int) throws {
        for (fruit, requiredQuantity) in fruitsStock {
            let requestedAmount = requiredQuantity * amount
            let availableQuantity = fruitStorage[fruit] ?? 0
            
            if requestedAmount > availableQuantity {
                throw FruitResultError.outOfStockError
            }
        }
    }
}





