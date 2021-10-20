//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum FruitStoreError: Error {
    case outOfStock
    case invalidSelection
}

class FruitStore {
    static let initialFruitsQuantity: Int = 10
    var inventory: [Fruit: Int] = initializeInventory()
    
    static func initializeInventory() -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = FruitStore.initialFruitsQuantity
        }
        
        return inventory
    }
}
