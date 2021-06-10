//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    private var strawberry = 10
    private var banana = 10
    private var kiwi = 10
    private var pineapple = 10
    private var mango = 10
    
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
