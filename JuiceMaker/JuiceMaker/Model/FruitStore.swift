//
//  JuiceMaker - FruitStore.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private let defaultInventory: Int
    var inventory: [Fruit: Int]

    init() {
        defaultInventory = 10
        inventory = [.strawberry: defaultInventory,
                     .banana: defaultInventory,
                     .pineapple: defaultInventory,
                     .kiwi: defaultInventory,
                     .mango: defaultInventory]

    }
    
    
    func changeInventory(fruit: Fruit, fruitNumber: Int) {
        inventory[fruit] = fruitNumber
    }
}
