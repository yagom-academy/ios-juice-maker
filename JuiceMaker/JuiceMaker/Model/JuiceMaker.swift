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
            fruitStore.changeCount(fruit: .strawberry, usedCount: 16)
        case .bananaJuice:
            fruitStore.changeCount(fruit: .banana, usedCount: 2)
        case .kiwiJuice:
            fruitStore.changeCount(fruit: .kiwi, usedCount: 3)
        case .pineappleJuice:
            fruitStore.changeCount(fruit: .pineapple, usedCount: 2)
        case .strawberryBananaJuice:
            fruitStore.changeCount(fruit: .strawberry, usedCount: 10)
            fruitStore.changeCount(fruit: .banana, usedCount: 1)
        case .mangoJuice:
            fruitStore.changeCount(fruit: .mango, usedCount: 3)
        case .mangoKiwiJuice:
            fruitStore.changeCount(fruit: .mango, usedCount: 2)
            fruitStore.changeCount(fruit: .kiwi, usedCount: 1)
        }
    }
}
