//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Menu {
        case strawberryJuice,
             bananaJuice,
             kiwiJuice,
             pineappleJuice,
             strawberryBananaJuice,
             mangoJuice,
             mangoKiwiJuice
        struct Ingredient {
            let fruit: Fruit, count: Int
        }
        var ingredient: [Ingredient] {
            switch self {
            case .strawberryJuice:
                return [Ingredient(fruit: .strawberry, count: 16)]
            case .bananaJuice:
                return [Ingredient(fruit: .banana, count: 2)]
            case .kiwiJuice:
                return [Ingredient(fruit: .kiwi, count: 3)]
            case .pineappleJuice:
                return [Ingredient(fruit: .pineapple, count: 2)]
            case .strawberryBananaJuice:
                return [Ingredient(fruit: .strawberry, count: 1),
                        Ingredient(fruit: .banana, count: 2)]
            case .mangoJuice:
                return [Ingredient(fruit: .mango, count: 3)]
            case .mangoKiwiJuice:
                return [Ingredient(fruit: .mango, count: 2),
                        Ingredient(fruit: .kiwi, count: 1)]
            }
        }
    }
    
    var fruitStore = FruitStore()
    
    
}
