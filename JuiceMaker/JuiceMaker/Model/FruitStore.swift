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
        for (fruit, variability) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.emptyFruit
            }
            
            self.fruitsInventory[fruit] = inventory + variability
        }
    }
    
    func reduceInventory(about fruitsInventory: FruitsInventory) throws {
        for (fruit, variability) in fruitsInventory {
            guard let inventory = fruitsInventory[fruit] else {
                throw FruitStoreError.emptyFruit
            }
            
            self.fruitsInventory[fruit] = inventory - variability
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
