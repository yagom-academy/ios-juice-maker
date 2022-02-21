//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    let defaultInventory: Int
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
