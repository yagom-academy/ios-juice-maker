//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruits: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitInventory: [Fruits: Int]
    
    init() {
        let defaultInventory = 10
        self.fruitInventory = [:]
        for fruit in Fruits.allCases {
            fruitInventory[fruit] = defaultInventory
        }
    }
    
    func bringFruit(_ fruit: Fruits, of difference: Int) {
        guard let numberOfFruit = fruitInventory[fruit], difference > 0 else {
            return
        }
        fruitInventory[fruit] = difference + numberOfFruit
    }
}
