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
    
    class FruitInventory {
        let fruit: Fruit
        var quantity: Int = FruitStore.initialFruitsQuantity
        
        init(fruit: Fruit) {
            self.fruit = fruit
        }
        
        func addFruits(quantity: Int) {
            self.quantity += quantity
        }
        
        func subtractFruits(quantity: Int) {
            self.quantity -= quantity
        }
    }
    
    let strawberries: FruitInventory = FruitInventory(fruit: .strawberry)
    let bananas: FruitInventory = FruitInventory(fruit: .banana)
    let pineapples: FruitInventory = FruitInventory(fruit: .pineapple)
    let kiwis: FruitInventory = FruitInventory(fruit: .kiwi)
    let mangoes: FruitInventory = FruitInventory(fruit: .mango)
}
