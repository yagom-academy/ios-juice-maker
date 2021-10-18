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
        
        mutating func addFruits(quantity: Int) {
            self.quantity += quantity
        }
        
        mutating func subtractFruits(quantity: Int) {
            self.quantity -= quantity
        }
    }
    
    var strawberries: FruitInventory = FruitInventory(fruit: .strawberry)
    var bananas: FruitInventory = FruitInventory(fruit: .banana)
    var pineapples: FruitInventory = FruitInventory(fruit: .pineapple)
    var kiwis: FruitInventory = FruitInventory(fruit: .kiwi)
    var mangoes: FruitInventory = FruitInventory(fruit: .mango)
}
