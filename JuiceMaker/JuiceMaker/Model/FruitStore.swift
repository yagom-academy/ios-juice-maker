//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    typealias FruitsInventory = [Fruit: Int]
    var fruitsInventory: [Fruit: Int] = [:]
    
    init() {
        Fruit.allCases.forEach {
            fruitsInventory[$0] = 10
        }
    }
    
    func increaseInventory(of increasingFruitsInventory: FruitsInventory) throws {
        for (fruit, variability) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.emptyFruit
            }
            
            fruitsInventory[fruit] = inventory + variability
        }
    }
    
    func reduceInventory(of reducingFruitsInventory: FruitsInventory) throws {
        for (fruit, variability) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.emptyFruit
            }
            
            fruitsInventory[fruit] = inventory - variability
        }
    }
    
    func hasEnoughInventory(reduced fruitsInventory: FruitsInventory) throws -> Bool {
        for (fruit, variability) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.emptyFruit
            }
            
            if inventory - variability < 0 {
                return false
            }
        }
        
        return true
    }

}
