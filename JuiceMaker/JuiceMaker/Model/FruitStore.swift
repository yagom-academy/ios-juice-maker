//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    var storage: [Fruit: Int] = [:]
    
    init() {
        self.storage = Fruit.setDefaultFruits()
    }
    
    func consume(fruit: Fruit, amount: Int) throws {
        if !hasEnoughStock(of: fruit, amount: amount) {
            throw JuiceMakerError.notEnoughFruitAmount(fruit: fruit.rawValue)
        }
        
        guard let oldAmount = storage[fruit] else {
            return
        }
        storage.updateValue(oldAmount - amount, forKey: fruit)
    }
    
    private func hasEnoughStock(of fruit: Fruit, amount: Int) -> Bool {
        guard let remainingAmount = storage[fruit] else {
            return false
        }
        
        guard remainingAmount >= amount else {
            return false
        }
        
        return true
    }
}
