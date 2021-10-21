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
    
    init(defaultStock: Int) {
        self.fruitInventory = [:]
        for fruit in Fruits.allCases {
            fruitInventory[fruit] = defaultStock
        }
    }
    
    convenience init() {
        self.init(defaultStock: 10)
    }
    
    func addFruit(_ fruit: Fruits, of difference: Int) {
        guard let numberOfFruit = fruitInventory[fruit], difference >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + difference
    }
    
    func subtractFruit(_ fruit: Fruits, of difference: Int) {
        guard let numberOfFruit = fruitInventory[fruit], difference >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - difference
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
}
