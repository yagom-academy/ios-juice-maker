//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private var storage: [Fruit: Int] = [:]
    
    init() {
        self.storage = Fruit.setDefaultFruits()
    }
    
    private func hasEnoughStock(of fruit: Fruit, amount: Int) throws -> Bool {
        guard let remainingAmount = storage[fruit] else {
            return false
        }
        
        guard remainingAmount >= amount else {
            return false
        }
        
        return true
    }
    
}
