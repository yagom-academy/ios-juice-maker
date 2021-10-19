//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, kiwi, pineapple, mango
    }
    
    var inventory: Dictionary<Fruit, Int>
    
    init(defaultValue: Int = 10) {
        self.inventory = [:]
        Fruit.allCases.forEach {
            inventory.updateValue(defaultValue, forKey: $0)
        }
    }
    
}
