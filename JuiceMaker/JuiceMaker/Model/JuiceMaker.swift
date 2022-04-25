//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceKind) {
        switch juiceName {
        case .strawberryJuice:
            fruitStore.subtractFruitAmount(fruitName: .strawberry, amount: 16)
        case .bananaJuice:
            fruitStore.subtractFruitAmount(fruitName: .banana, amount: 2)
        case .kiwiJuice:
            fruitStore.subtractFruitAmount(fruitName: .kiwi, amount: 3)
        case .pineappleJuice:
            fruitStore.subtractFruitAmount(fruitName: .pineaple, amount: 2)
        case .mangoJuice:
            fruitStore.subtractFruitAmount(fruitName: .mango, amount: 3)
        case .strawberryBananaJuice:
            fruitStore.subtractFruitAmount(fruitName: .strawberry, amount: 10)
            fruitStore.subtractFruitAmount(fruitName: .banana, amount: 1)
        case .mangoKiwiJuice:
            fruitStore.subtractFruitAmount(fruitName: .mango, amount: 2)
            fruitStore.subtractFruitAmount(fruitName: .kiwi, amount: 1)
        }
    }
    
    
}
