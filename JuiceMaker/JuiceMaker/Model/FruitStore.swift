//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
// 과일 저장소 타입
class FruitStore {
    var fruitsStock: Dictionary<Fruit, Int> = [:]

    init() {
        for fruit in Fruit.allCases {
            fruitsStock[fruit] = 10
        }
        
    }
    
}

var test = FruitStore()




