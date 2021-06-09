//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func currentStock(_ fruit: Fruit) -> Int {
            switch fruit {
            case .strawberry:
                return strawberry
            case .banana:
                return banana
            case .pineapple:
                return pineapple
            case .kiwi:
                return kiwi
            case .mango:
                return mango
            }
        }
    
    func changeStock(_ fruit: Fruit, _ changingQuantity: Int) {
            switch fruit {
            case .strawberry:
                strawberry -= changingQuantity
            case .banana:
                banana -= changingQuantity
            case .pineapple:
                pineapple -= changingQuantity
            case .kiwi:
                kiwi -= changingQuantity
            case .mango:
                mango -= changingQuantity
            }
        }
}
