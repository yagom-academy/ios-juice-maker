//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func makeJuice(with recipe: Recipe) {
        let fruitStore: FruitStore = FruitStore()
        
        switch recipe {
        case .strawberryJuice(strawberry: let quantity):
            fruitStore.changeStock(of: fruitStore.strawberry, by: quantity)
        case .bananaJuice(banana: let quantity):
            fruitStore.changeStock(of: fruitStore.banana, by: quantity)
        case .kiwiJuice(kiwi: let quantity):
            fruitStore.changeStock(of: fruitStore.kiwi, by: quantity)
        case .pineappleJuice(pineapple: let quantity):
            fruitStore.changeStock(of: fruitStore.pineapple, by: quantity)
        case .strawberryBananaJuice(let strawberryQuantity, let bananaQuantity):
            fruitStore.changeStock(of: fruitStore.strawberry, fruitStore.banana,
                                   by: strawberryQuantity, bananaQuantity)
        case .mangoJuice(mango: let quantity):
            fruitStore.changeStock(of: fruitStore.mango, by: quantity)
        case .mangoKiwiJuice(let mangoQuantity, let kiwiQuantity):
            fruitStore.changeStock(of: fruitStore.mango, fruitStore.kiwi,
                                   by: mangoQuantity, kiwiQuantity)
        }
    }
}
