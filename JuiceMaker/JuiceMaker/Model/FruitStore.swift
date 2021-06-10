//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    private let defaultStock: Int = 10
    private var strawberry: Int
    private var banana: Int
    private var kiwi: Int
    private var pineapple: Int
    private var mango: Int
    
    init() {
        strawberry = defaultStock
        banana = defaultStock
        kiwi = defaultStock
        pineapple = defaultStock
        mango = defaultStock
    }
    
    func getStock(of fruit: Fruits) -> Int {
        switch fruit {
        case .strawberry:
            return strawberry
        case .banana:
            return banana
        case .kiwi:
            return kiwi
        case .pineapple:
            return pineapple
        case .mango:
            return mango
        }
    }
    
    func addStock(of fruit: Fruits, amount: Int) {
        switch fruit {
        case .strawberry:
            strawberry += amount
        case .banana:
            banana += amount
        case .kiwi:
            kiwi += amount
        case .pineapple:
            pineapple += amount
        case .mango:
            mango += amount
        }
    }
    
    func subtractStock(of fruit: Fruits, amount: Int) {
        switch fruit {
        case .strawberry:
            strawberry -= amount
        case .banana:
            banana -= amount
        case .kiwi:
            kiwi -= amount
        case .pineapple:
            pineapple -= amount
        case .mango:
            mango -= amount
        }
    }
}
