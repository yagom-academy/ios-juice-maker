//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

class FruitStore {
    static let shared: FruitStore = FruitStore()
    
    private(set) var inventoryList: [Fruit: Int] = [:] {
        didSet {
            NotificationCenter.default.post(name: .inventoryChanged,
                                            object: nil)
        }
    }
    let defaultValueOfInventory = 10
    
    private init() {
        Fruit.allCases.forEach {
            inventoryList[$0] = defaultValueOfInventory
        }
    }
    
    func increase(of fruit: Fruit, by amount: Int) {
        if amount >= 0,
           let inventory = inventoryList[fruit] {
            self.inventoryList.updateValue(inventory + amount, forKey: fruit)
        }
    }
    
    func reduce(of fruit: Fruit, by amount: Int) throws {
        if hasEnoughInventory(of: fruit, to: amount),
           let inventory = inventoryList[fruit] {
            self.inventoryList.updateValue(inventory - amount, forKey: fruit)
        } else {
            throw FruitStoreError.insufficientInventory
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
}
