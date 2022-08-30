//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsInventory: [Fruit: Int] = [:]
    
    init() {
        Fruit.allCases.forEach {
            fruitsInventory[$0] = 10
        }
    }
}
