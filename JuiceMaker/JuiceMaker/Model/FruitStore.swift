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
    
    func consume(menu: Juice.Menu) {
        let temp = Juice.recipe(menu: menu)
        
        do {
            try temp.forEach {
                if try !hasEnoughStock(of: $0.fruit, amount: $0.amount) {
                    return
                }
            }
        } catch {
            
        }
        
        for fruit2 in temp {
            guard let fruitAmount = storage[fruit2.fruit] else {
                return
            }
            storage.updateValue(fruitAmount - fruit2.amount, forKey: fruit2.fruit)
        }
    }
}
