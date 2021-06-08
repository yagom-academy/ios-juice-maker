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
    
    func addStock(of fruit: Fruits, amout: Int) {
        switch fruit {
        case .strawberry:
            strawberry += amout
        case .banana:
            banana += amout
        case .kiwi:
            kiwi += amout
        case .pineapple:
            pineapple += amout
        case .mango:
            mango += amout
        }
    }
    
    func minusStock(of fruit: Fruits, amout: Int) {
        switch fruit {
        case .strawberry:
            strawberry -= amout
        case .banana:
            banana -= amout
        case .kiwi:
            kiwi -= amout
        case .pineapple:
            pineapple -= amout
        case .mango:
            mango -= amout
        }
    }
}
