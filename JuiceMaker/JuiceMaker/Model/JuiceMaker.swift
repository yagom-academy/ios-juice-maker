//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func manufactorJuice(menu: Juice) {
        switch menu {
        case .strawberryJuice:
            fruitStore.substractFruits(fruit: .strawberry, amount: 16)
        case .bananaJuice:
            fruitStore.substractFruits(fruit: .banana, amount: 2)
        case .pineappleJuice:
            fruitStore.substractFruits(fruit: .pineapple, amount: 2)
        case .kiwiJuice:
            fruitStore.substractFruits(fruit: .kiwi, amount: 3)
        case .mangoJuice:
            fruitStore.substractFruits(fruit: .mango, amount: 3)
        case .strawberryBananaJuice:
            fruitStore.substractFruits(fruit: .strawberry, amount: 10)
            fruitStore.substractFruits(fruit: .banana, amount: 1)
        case .mangoKiwiJuice:
            fruitStore.substractFruits(fruit: .mango, amount: 2)
            fruitStore.substractFruits(fruit: .kiwi, amount: 1)
        }
    }
}
