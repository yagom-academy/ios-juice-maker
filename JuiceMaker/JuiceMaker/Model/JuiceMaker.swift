//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    enum Recipe {
        case strawberryJuice(strawberryNeeded: Int = 16)
        case bananaJuice(bananaNeeded: Int = 2)
        case kiwiJuice(kiwiNeeded: Int = 3)
        case pineappleJuice(pineappleNeeded: Int = 2)
        case ddalbaJuice(strawberryNeeded: Int = 10, bananaNeeded: Int = 1)
        case mangoJuice(mangoNeeded: Int = 3)
        case mangoKiwiJuice(mangoNeeded: Int = 2, kiwiNeeded: Int = 1)
    }
    
    struct ConsumeAmount {
        let amount: Int
    }
    
    var fruitStore: FruitStore?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(recipe: Recipe) {
        switch recipe {
        case .strawberryJuice(let strawberryNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded)
        case .bananaJuice(let bananaNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded)
        case .kiwiJuice(let kiwiNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded)
        case .pineappleJuice(let pineappleNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .pineapple, number: pineappleNeeded)
        case .ddalbaJuice(let strawberryNeeded, let bananaNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded)
            fruitStore?.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded)
        case .mangoJuice(let mangoNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded)
        case .mangoKiwiJuice(let mangoNeeded, let kiwiNeeded):
            fruitStore?.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded)
            fruitStore?.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded)
        }
    }
    
}

var juiceMaker = JuiceMaker(fruitStore: FruitStore())



