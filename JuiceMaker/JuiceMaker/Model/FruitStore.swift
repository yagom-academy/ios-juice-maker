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
    
    func increaseInventory(of fruit: Fruit, by amount: Int) {
        if amount >= 0,
           let inventory = fruitsInventory[fruit] {
            self.fruitsInventory.updateValue(inventory + amount, forKey: fruit)
        }
    }
    
    func reduceInventory(of fruit: Fruit, by amount: Int) throws {
        if hasEnoughInventory(of: fruit, to: amount),
           let inventory = fruitsInventory[fruit] {
            self.fruitsInventory.updateValue(inventory - amount, forKey: fruit)
        } else {
            throw FruitStoreError.insufficientInventory
        }
    }
    
    func hasEnoughInventory(of fruit: Fruit, to amount: Int) -> Bool {
        if let inventory = fruitsInventory[fruit],
           inventory >= amount {
            return true
        }
        return false
    }

}
