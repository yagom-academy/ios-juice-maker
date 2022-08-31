//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    typealias FruitsInventory = [Fruit: Int]
    private(set) var fruitsInventory: [Fruit: Int] = [:]
    let defaultValueOfInventory = 10
    
    init() {
        Fruit.allCases.forEach {
            fruitsInventory[$0] = defaultValueOfInventory
        }
    }
    
    func increaseInventory(about fruitsInventory: FruitsInventory) throws {
        for (fruit, count) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.noneFruit
            }
            
            self.fruitsInventory[fruit] = inventory + count
        }
    }
    
    func reduceInventory(about fruitsInventory: FruitsInventory) throws {
        for (fruit, count) in fruitsInventory {
            guard var inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.noneFruit
            }
            
            inventory -= count
            if inventory < 0 {
                throw FruitStoreError.insufficientInventory
            }
            
            self.fruitsInventory[fruit] = inventory
        }
    }
    
    func hasEnoughInventory(reduced fruitsInventory: FruitsInventory) throws -> Bool {
        for (fruit, count) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.noneFruit
            }
            
            if inventory - count < 0 {
                return false
            }
        }
        
        return true
    }

}
