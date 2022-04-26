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
    
    func usedLeftover(_ fruit: Fruit, by amount :Int) {
        guard (fruitInventory[fruit]? -= amount) != nil else {
            return
        }
    }
    
    func checkInventory(about fruit: Fruit, by amount :Int) throws {
        guard let stock = fruitInventory[fruit],
              stock >= amount else {
            throw JuiceMakerError.outOfStock
        }
    }
}
