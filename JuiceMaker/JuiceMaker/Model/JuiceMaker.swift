//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(_ juice: Juice) throws {
        switch juice {
        case .strawberryJuice:
            guard self.fruitStore.fruits[.strawberry, default: 0] >= 16 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .strawberry, to: 16)
        case .bananaJuice:
            guard self.fruitStore.fruits[.strawberry, default: 0] >= 2 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .banana, to: 2)
        case .kiwiJuice:
            guard self.fruitStore.fruits[.strawberry, default: 0] >= 3 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .kiwi, to: 3)
        case .pineappleJuice:
            guard self.fruitStore.fruits[.pineapple, default: 0] >= 2 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .pineapple, to: 2)
        case .mangoJuice:
            guard self.fruitStore.fruits[.mango, default: 0] >= 3 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .mango, to: 3)
        case .strawberryBananaJuice:
            guard self.fruitStore.fruits[.strawberry, default: 0] >= 10,
                  self.fruitStore.fruits[.banana, default: 0] >= 1 else {
                      throw JuiceMakerError.outOfStock
                  }
            self.fruitStore.decrease(fruit: .strawberry, to: 10)
            self.fruitStore.decrease(fruit: .banana, to: 1)
        case .mangoKiwiJuice:
            guard self.fruitStore.fruits[.mango, default: 0] >= 2,
                  self.fruitStore.fruits[.kiwi, default: 0] >= 1 else {
                      throw JuiceMakerError.outOfStock
                  }
            self.fruitStore.decrease(fruit: .mango, to: 2)
            self.fruitStore.decrease(fruit: .kiwi, to: 1)
        }
    }
    
}
