//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private var fruitInventory: [Fruits: Int]
    
    var inventoryStatus: [Fruits: Int] {
        return fruitInventory
    }
    
    static let shared = FruitStore()
    
    private init(defaultStock: Int) {
        self.fruitInventory = [:]
        Fruits.allCases.forEach { fruitInventory[$0] = defaultStock }
    }
    
    private convenience init() {
        self.init(defaultStock: 10)
    }
    
    func add(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + count
    }
    
    func subtract(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - count
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
    
}
