//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    var strawberry = 10
    var banana = 10
    var kiwi = 10
    var pineapple = 10
    var mango = 10
    
    func getStock(of fruit: Fruits) -> Int {
        switch fruit {
        case .strawberry:
            return strawberry
        case .banana:
            return banana
        case .kiwi:
            return kiwi
        case .pienapple:
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
        case .pienapple:
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
        case .pienapple:
            pineapple -= amout
        case .mango:
            mango -= amout
        }
    }
}
