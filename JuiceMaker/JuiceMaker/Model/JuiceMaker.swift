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
    enum Recipe {
        static let usageOfStrawberry = 16
        static let usageOfBanana = 2
        static let usageOfPineapple = 2
        static let usageOfKiwi = 3
        static let usageOfMango = 3
        static let usageOfMixStrawberry = 10
        static let usageOfMixBanana = 1
        static let usageOfMixMango = 2
        static let usageOfMixKiwi = 1
    }

    private let fruitStore = FruitStore()

    func makeFruitJuice(juice: Menu) {
        switch juice {
        case .strawberryJuice:
            fruitStore.consumeStock(of: .strawberry, amount: Recipe.usageOfStrawberry)
        case .bananaJuice:
            fruitStore.consumeStock(of: .banana, amount: Recipe.usageOfBanana)
        case .pineappleJuice:
            fruitStore.consumeStock(of: .pineapple, amount: Recipe.usageOfPineapple)
        case .kiwiJuice:
            fruitStore.consumeStock(of: .kiwi, amount: Recipe.usageOfKiwi)
        case .mangoJuice:
            fruitStore.consumeStock(of: .mango, amount: Recipe.usageOfMango)
        case .strawberryBananaJuice:
            fruitStore.consumeTwoKindsOfFruits(first: .strawberry, firstAmount: Recipe.usageOfMixStrawberry,
                                        second: .banana, secondAmount: Recipe.usageOfMixBanana)
        case .mangoKiwiJuice:
            fruitStore.consumeTwoKindsOfFruits(first: .mango, firstAmount: Recipe.usageOfMixMango,
                                        second: .kiwi, secondAmount: Recipe.usageOfMixKiwi)
        }
    }
}
