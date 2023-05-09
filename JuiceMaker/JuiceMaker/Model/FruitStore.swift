//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruits: [FruitType: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func getFruitCount(fruitType: FruitType) -> Int? {
        return fruits[fruitType]
    }
    
    func addFruitCount(at fruit: FruitType, with addCount: Int) {
        guard var currentCount = fruits[fruit] else {
            fruits[fruit] = addCount
            return
        }
        currentCount += addCount
        fruits[fruit] = currentCount
    }
}
