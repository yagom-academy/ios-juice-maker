//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

/// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore : FruitStoreType
    
    // JuiceMaker.make(.strawberry)
    func make(_ juice: Juice) {
        switch juice {
        case .strawberry:
            fruitStore.consume(.strawberry, amount: 16)
        case .banana:
            fruitStore.consume(.banana, amount: 2)
        case .kiwi:
            fruitStore.consume(.kiwi, amount: 3)
        case .pineapple:
            fruitStore.consume(.pineapple, amount: 2)
        case .strawberryBanana:
            fruitStore.consume(.strawberry, amount: 10)
            fruitStore.consume(.banana, amount: 1)
        case .mango:
            fruitStore.consume(.mango, amount: 3)
        case .mangoKiwi:
            fruitStore.consume(.mango, amount: 2)
            fruitStore.consume(.kiwi, amount: 1)
        }
    }
}
