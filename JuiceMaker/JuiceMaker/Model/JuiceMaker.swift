//
//  JuiceMaker - JuiceMaker.swift
//  Created by Mene, Dragon. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    static let store = FruitStore(initialFruitAmount: 10)
    
    func makeJuice(of juice: Juice) -> Bool {
        let recipe = juice.recipe
        
        for (fruit, _) in recipe {
            guard let fruitStock = JuiceMaker.store.inventory[fruit] else { return false }
            guard let fruitRequiredNumber = recipe[fruit] else { return false }
            
            if fruitStock < fruitRequiredNumber {
                return false
            }
        }
        
        for (fruit, _) in recipe {
            guard let fruitStock = JuiceMaker.store.inventory[fruit] else { return false }
            guard let fruitRequiredNumber = recipe[fruit] else { return false }

            JuiceMaker.store.inventory[fruit] = fruitStock - fruitRequiredNumber
        }
        
        return true
    }
    
    func checkStock(of fruit: Fruit) -> String? {
        guard let fruitStock = JuiceMaker.store.inventory[fruit] else { return nil }
        return String(fruitStock)
    }
}
