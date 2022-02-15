//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    private var fruitStore: FruitStore = FruitStore()
    
    mutating func make(of juice: Juice) throws {
        guard let neededFruits = Recipe.get(juice) else {
            throw JuiceMakerError.notExistRecipeError
        }
        try validateStock(of: neededFruits)
        try useStock(of: neededFruits)
    }
    
    private func validateStock(of neededFruits: [Recipe.NeededFruit]) throws {
        let outOfStocks = neededFruits.filter { neededFruit in
            let stock = fruitStore.getStock(of: neededFruit.fruit)
            return stock < neededFruit.quantity
        }
        if outOfStocks.count > 0 {
            throw JuiceMakerError.soldOutError
        }
    }
    
    mutating private func useStock(of neededFruits: [Recipe.NeededFruit]) throws {
        try neededFruits.forEach { neededFruits in
            try fruitStore.decreaseStock(of: neededFruits.fruit, neededFruits.quantity)
        }
    }
    
}

extension JuiceMaker {
    
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice
        case strawberryBananaJuice, mangoJuice, mangoKiwiJuice
    }
    
    enum JuiceMakerError: Error {
        case soldOutError
        case notExistRecipeError
    }
    
    private struct Recipe {
        
        struct NeededFruit {
            let fruit: FruitStore.Fruit
            let quantity: Quantity
        }
        
        private static let recipe: [Juice: [NeededFruit]] = [
            .strawberryJuice: [
                NeededFruit(fruit: .strawberry, quantity: Quantity(16)),
            ],
            .bananaJuice: [
                NeededFruit(fruit: .banana, quantity: Quantity(2)),
            ],
            .kiwiJuice: [
                NeededFruit(fruit: .banana, quantity: Quantity(3)),
            ],
            .pineappleJuice: [
                NeededFruit(fruit: .pineapple, quantity: Quantity(2)),
            ],
            .strawberryBananaJuice: [
                NeededFruit(fruit: .strawberry, quantity: Quantity(10)),
                NeededFruit(fruit: .banana, quantity: Quantity(2)),
            ],
            .mangoJuice: [
                NeededFruit(fruit: .mango, quantity: Quantity(3)),
            ],
            .mangoKiwiJuice: [
                NeededFruit(fruit: .mango, quantity: Quantity(2)),
                NeededFruit(fruit: .kiwi, quantity: Quantity(1)),
            ],
        ]
        
        static func get(_ juice: Juice) -> [NeededFruit]? {
            return recipe[juice]
        }

    }
    
}
