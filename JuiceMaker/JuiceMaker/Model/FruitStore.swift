//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    enum InventoryManageError: LocalizedError {
        case outOfStock
    }
    
    private var fruitInventory: [Fruits: Int]
    
    init() {
        let defaultStock = 10
        self.fruitInventory = [:]
        for fruit in Fruits.allCases {
            fruitInventory[fruit] = defaultStock
        }
    }
    
    func addFruit(_ fruit: Fruits, of difference: Int) {
        guard let numberOfFruit = fruitInventory[fruit], difference >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + difference
    }
    
    func subtractFruit(_ fruit: Fruits, of difference: Int) throws {
        guard let numberOfFruit = fruitInventory[fruit], difference >= 0 else {
            return
        }
        try checkInventory(fruit: fruit, count: difference)
        fruitInventory[fruit] = numberOfFruit - difference
    }
    
    private func checkInventory(fruit: Fruits, count: Int) throws {
        guard let numberOfFruit = fruitInventory[fruit], numberOfFruit >= count else {
            throw InventoryManageError.outOfStock
        }
    }
}
