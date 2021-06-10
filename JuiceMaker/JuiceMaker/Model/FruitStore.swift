//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    
    static let defaultStock: UInt = 10
    
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    static var storage: [Fruit: UInt] = [.strawberry: defaultStock, .banana: defaultStock, .pineapple: defaultStock, .kiwi: defaultStock, .mango: defaultStock]
    
    func modifyStock(fruit: Fruit, count: UInt) {
        FruitStore.storage[fruit] = count
    }
}

