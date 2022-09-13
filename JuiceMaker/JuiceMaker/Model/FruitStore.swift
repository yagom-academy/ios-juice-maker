//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

class FruitStore {
    private(set) var inventoryList: [Fruit: Int] = [:]
    let defaultValueOfInventory = 10
    
    init() {
        Fruit.allCases.forEach {
            inventoryList[$0] = defaultValueOfInventory
        }
    }
    
    func reduce(by amount: [Fruit: Int]) throws {
        try amount.forEach { (fruit: Fruit, amount: Int) in
            if !hasEnoughInventory(of: fruit, to: amount) {
                throw FruitStoreError.insufficientInventory
            }
        }
        
        amount.forEach { (fruit: Fruit, amount: Int) in
            if let inventory = inventoryList[fruit] {
                self.inventoryList.updateValue(inventory - amount, forKey: fruit)
            }
        }
    }
    
    func hasEnoughInventory(of fruit: Fruit, to amount: Int) -> Bool {
        if let inventory = inventoryList[fruit],
           inventory >= amount {
            return true
        }
        return false
    }
    
    func update(to inventoryList: [Fruit: Int]) {
        self.inventoryList = inventoryList
    }
}
