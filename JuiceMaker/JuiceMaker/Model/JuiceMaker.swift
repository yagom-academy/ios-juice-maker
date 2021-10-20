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
    enum JuiceRecipe {
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
            fruitStore.consumeFruit(name: .strawberry, amount: JuiceRecipe.usageOfStrawberry)
        case .bananaJuice:
            fruitStore.consumeFruit(name: .banana, amount: JuiceRecipe.usageOfBanana)
        case .pineappleJuice:
            fruitStore.consumeFruit(name: .pineapple, amount: JuiceRecipe.usageOfPineapple)
        case .kiwiJuice:
            fruitStore.consumeFruit(name: .kiwi, amount: JuiceRecipe.usageOfKiwi)
        case .mangoJuice:
            fruitStore.consumeFruit(name: .mango, amount: JuiceRecipe.usageOfMango)
        case .strawberryBananaJuice:
            fruitStore.consumeTwoFruits(first: .strawberry, firstAmount: JuiceRecipe.usageOfMixStrawberry,
                                        second: .banana, secondAmount: JuiceRecipe.usageOfMixBanana)
        case .mangoKiwiJuice:
            fruitStore.consumeTwoFruits(first: .mango, firstAmount: JuiceRecipe.usageOfMixMango,
                                        second: .kiwi, secondAmount: JuiceRecipe.usageOfMixKiwi)
        }
    }
}
