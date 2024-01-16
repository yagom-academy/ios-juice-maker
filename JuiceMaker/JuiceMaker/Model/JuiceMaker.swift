//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(menuNumber: Menu) {
        switch menuNumber {
        case .strawberryJuice:
            fruitStore.manageFruit(fruit: .strawberry, usedCount: 16)
        case .bananaJuice:
            fruitStore.manageFruit(fruit: .banana, usedCount: 2)
        case .kiwiJuice:
            fruitStore.manageFruit(fruit: .kiwi, usedCount: 3)
        case .pineappleJuice:
            fruitStore.manageFruit(fruit: .pineapple, usedCount: 2)
        case .strawberryBananaJuice:
            fruitStore.manageFruit(fruit: .strawberry, usedCount: 10)
            fruitStore.manageFruit(fruit: .banana, usedCount: 1)
        case .mangoJuice:
            fruitStore.manageFruit(fruit: .mango, usedCount: 3)
        case .mangoKiwiJuice:
            fruitStore.manageFruit(fruit: .mango, usedCount: 2)
            fruitStore.manageFruit(fruit: .kiwi, usedCount: 1)
        }
    }
}
