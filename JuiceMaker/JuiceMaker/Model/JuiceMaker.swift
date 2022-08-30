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
        struct Recipe {
            let fruit: Fruit, amount: Int
        }
        var recipe: [Recipe] {
            switch self {
            case .strawberryJuice:
                return [Recipe(fruit: .strawberry, amount: 16)]
            case .bananaJuice:
                return [Recipe(fruit: .banana, amount: 2)]
            case .kiwiJuice:
                return [Recipe(fruit: .kiwi, amount: 3)]
            case .pineappleJuice:
                return [Recipe(fruit: .pineapple, amount: 2)]
            case .strawberryBananaJuice:
                return [Recipe(fruit: .strawberry, amount: 1),
                        Recipe(fruit: .banana, amount: 2)]
            case .mangoJuice:
                return [Recipe(fruit: .mango, amount: 3)]
            case .mangoKiwiJuice:
                return [Recipe(fruit: .mango, amount: 2),
                        Recipe(fruit: .kiwi, amount: 1)]
            }
        }
    }
    
    var fruitStore = FruitStore()
    
    
}
