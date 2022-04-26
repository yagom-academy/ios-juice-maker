//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    var fruitData: [Fruit: Int] = [:]
    
    init() {
        let initialInventory = 10
        for element in Fruit.allCases {
            fruitData[element] = initialInventory
        }
    }
}
