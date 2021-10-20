//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
    }
    let fruitStore = FruitStore()
    
    func makeFruitJuice(juice: Menu) {
        switch juice {
        case .strawberryJuice:
            fruitStore.consumeFruit(name: .strawberry, amount: 16)
        case .bananaJuice:
            fruitStore.consumeFruit(name: .banana, amount: 2)
        case .pineappleJuice:
            fruitStore.consumeFruit(name: .pineapple, amount: 2)
        case .kiwiJuice:
            fruitStore.consumeFruit(name: .kiwi, amount: 3)
        case .mangoJuice:
            fruitStore.consumeFruit(name: .mango, amount: 3)
        case .strawberryBananaJuice:
            fruitStore.consumeFruit(name: .strawberry, amount: 10)
            fruitStore.consumeFruit(name: .banana, amount: 1)
        case .mangoKiwiJuice:
            fruitStore.consumeFruit(name: .mango, amount: 2)
            fruitStore.consumeFruit(name: .kiwi, amount: 1)
        }
    }
}
