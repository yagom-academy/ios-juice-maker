//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Combination = (fruitName: FruitCategory, count: Int)

struct Recipe {
    struct strawberryJuice {
        static let strawberryCount = 16
    }
    
    struct bananaJuice {
        static let bananaCount = 3
    }
    
    struct kiwiJuice {
        static let kiwiCount = 3
    }
    
    struct pineappleJuice {
        static let pineappleCount = 2
    }
    
    struct strawberryBananaJuice {
        static let strawberryCount = 10
        static let bananaCount = 1
    }
    
    struct mangoJuice {
        static let mangoCount = 3
    }
    
    struct mangoKiwiJuice {
        static let mangoCount = 2
        static let kiwiCount = 1
    }
}

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(menuNumber: JuiceMenu) {
//        switch menuNumber {
//        case .strawberryJuice:
//            fruitStore.manageFruit(fruit: .strawberry, usedCount: 16)
//        case .bananaJuice:
//            fruitStore.manageFruit(fruit: .banana, usedCount: 2)
//        case .kiwiJuice:
//            fruitStore.manageFruit(fruit: .kiwi, usedCount: 3)
//        case .pineappleJuice:
//            fruitStore.manageFruit(fruit: .pineapple, usedCount: 2)
//        case .strawberryBananaJuice:
//            fruitStore.manageFruit(fruit: .strawberry, usedCount: 10)
//            fruitStore.manageFruit(fruit: .banana, usedCount: 1)
//        case .mangoJuice:
//            fruitStore.manageFruit(fruit: .mango, usedCount: 3)
//        case .mangoKiwiJuice:
//            fruitStore.manageFruit(fruit: .mango, usedCount: 2)
//            fruitStore.manageFruit(fruit: .kiwi, usedCount: 1)
//        }
    }
}
