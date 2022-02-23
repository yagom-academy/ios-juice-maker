//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    
    func subtractFruitQuantity(by juice: Juice) {
        switch juice {
        case .strawberryJuice:
            self.fruitStore.changeFruitQuantity(by: .strawberry, count: -16)
        case .bananaJuice:
            self.fruitStore.changeFruitQuantity(by: .banana, count: -2)
        case .pineappleJuice:
            self.fruitStore.changeFruitQuantity(by: .pineapple, count: -2)
        case .kiwiJuice:
            self.fruitStore.changeFruitQuantity(by: .kiwi, count: -3)
        case .mangoJuice:
            self.fruitStore.changeFruitQuantity(by: .mango, count: -3)
        case .strawberryBananaJuice:
            self.fruitStore.changeFruitQuantity(by: .strawberry, count: -10)
            self.fruitStore.changeFruitQuantity(by: .banana, count: -1)
        case .mangoKiwiJuice:
            self.fruitStore.changeFruitQuantity(by: .mango, count: -2)
            self.fruitStore.changeFruitQuantity(by: .kiwi, count: -1)
        }
    }
}
