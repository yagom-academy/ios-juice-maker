//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMakerError: Error {
    case cannotPlaceOrder
}

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var requiredIngredient: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func checkJuice(juice: Juice) throws {
        for (fruit, quantity) in juice.requiredIngredient {
            do {
                try fruitStore.checkStock(fruit: fruit, quantity: quantity)
            } catch {
                throw JuiceMakerError.cannotPlaceOrder
            }
        }
    }
    
    func makeJuice(juice: Juice) throws {
        try checkJuice(juice: juice)
        
        for (fruit, quantity) in juice.requiredIngredient {
            try? fruitStore.consumeStock(fruit: fruit, quantity: quantity)
        }
    }
}
