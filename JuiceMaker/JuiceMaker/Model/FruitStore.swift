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
}
