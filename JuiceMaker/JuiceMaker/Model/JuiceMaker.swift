//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    typealias Recipe = (fruit: FruitStore.Fruit, amount: Int)
    
    enum FruitJuice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var juiceRecipe: Array<Recipe> {
            switch self {
            case .strawberryJuice:
                return [(fruit: FruitStore.Fruit.strawberry, amount: 16)]
            case .bananaJuice:
                return [(fruit: FruitStore.Fruit.banana, amount: 2)]
            case .kiwiJuice:
                return [(fruit: FruitStore.Fruit.kiwi, amount: 3)]
            case .pineappleJuice:
                return [(fruit: FruitStore.Fruit.pineapple, amount: 2)]
            case .strawberryBananaJuice:
                return [(fruit: FruitStore.Fruit.strawberry, amount: 10), (fruit: FruitStore.Fruit.banana, amount: 1)]
            case .mangoJuice:
                return [(fruit: FruitStore.Fruit.mango, amount: 3)]
            case .mangoKiwiJuice:
                return [(fruit: FruitStore.Fruit.mango, amount: 2), (fruit: FruitStore.Fruit.kiwi, amount: 1)]
            }
        }
    }
}
