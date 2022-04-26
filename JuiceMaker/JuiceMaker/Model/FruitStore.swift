//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitInventory: [Fruit:Int] = [:]
    
    init() {
        fruitInventory = [.strawberry: 10, .banana: 10, .kiwi: 10, .pineapple: 10, .mango: 10]
    }
    
    func changeInventory(fruits: [Fruit:Int]) {
        for (fruit,count) in fruits {
            fruitInventory[fruit, default: 10] -= count
        }
    }
    
    func checkGenerationAvailable(fruit: Fruit, count :Int) throws {
        guard let stock = fruitInventory[fruit],
                  stock >= count else {
            throw JuiceMakerError.outOfStock
        }
    }
}
