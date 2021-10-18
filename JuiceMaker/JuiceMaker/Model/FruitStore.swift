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

class FruitStore {
    static let defaultAmountPerFruit = 10
    var inventory: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            self.inventory[fruit] = FruitStore.defaultAmountPerFruit
        }
    }
}
