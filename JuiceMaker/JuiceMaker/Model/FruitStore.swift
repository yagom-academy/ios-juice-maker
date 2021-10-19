//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruits {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitInventory: [Fruits:Int]?
}
