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
    
    let defaultInventory: Int = 10
    var inventory: [Fruit: Int] = [.strawberry: 10,
                                   .banana: 10,
                                   .pineapple: 10,
                                   .kiwi: 10,
                                   .mango: 10]
    
}
