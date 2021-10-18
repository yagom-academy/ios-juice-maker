//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    static let initialFruitsQuantity: Int = 10
    
    struct FruitInventory {
        let fruit: Fruit
        var quantity: Int = FruitStore.initialFruitsQuantity
        
        init(fruit: Fruit) {
            self.fruit = fruit
        }
    }
}
