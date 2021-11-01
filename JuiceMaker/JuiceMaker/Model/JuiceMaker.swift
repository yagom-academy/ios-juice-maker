//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private let fruitStorage: FruitStore
    
    init(fruitStorage: FruitStore) {
        self.fruitStorage = fruitStorage
    }
    
    func order(juice: Juice) -> Juice? {
        
        return canMake(juice: juice) ? make(juice: juice) : nil
    }
    
    private func canMake(juice: Juice) -> Bool {
        for (fruit, count) in juice.recipe {
            if fruitStorage.hasStock(of: fruit, count: count) == false {
                return false
            }
        }
        return true
    }
    
    private func make(juice: Juice) -> Juice {
        juice.recipe.forEach { fruitStorage.subtract(fruit: $0, of: $1) }
        return juice
    }
}
