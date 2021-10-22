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
            fruitStore.consumeFruits(firstFruit: .strawberry, firstFruitAmount: Recipe.usageOfStrawberry)
        case .bananaJuice:
            fruitStore.consumeFruits(firstFruit: .banana, firstFruitAmount: Recipe.usageOfBanana)
        case .pineappleJuice:
            fruitStore.consumeFruits(firstFruit: .pineapple, firstFruitAmount: Recipe.usageOfPineapple)
        case .kiwiJuice:
            fruitStore.consumeFruits(firstFruit: .kiwi, firstFruitAmount: Recipe.usageOfKiwi)
        case .mangoJuice:
            fruitStore.consumeFruits(firstFruit: .mango, firstFruitAmount: Recipe.usageOfMango)
        case .strawberryBananaJuice:
            fruitStore.consumeFruits(firstFruit: .strawberry, firstFruitAmount: Recipe.usageOfMixStrawberry,
                                     secondFruit: .banana, secondFruitAmount: Recipe.usageOfMixBanana)
        case .mangoKiwiJuice:
            fruitStore.consumeFruits(firstFruit: .mango, firstFruitAmount: Recipe.usageOfMixMango,
                                     secondFruit: .kiwi, secondFruitAmount: Recipe.usageOfMixKiwi)
        }
    }
}
