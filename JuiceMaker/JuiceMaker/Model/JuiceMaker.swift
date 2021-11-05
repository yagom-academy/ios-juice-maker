//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    enum Menu: Int {
        case strawberryJuice = 0
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
        var description: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .pineappleJuice:
                return "파인애플쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .mangoJuice:
                return "망고쥬스"
            case .strawberryBananaJuice:
                return "딸기바나나쥬스"
            case .mangoKiwiJuice:
                return "망고키위쥬스"
            }
        }
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
    
    var stockOfFruit: [Fruit: Int] {
        fruitStore.stockOfFruit
    }
    
    func orderFruitJuice(juice: Menu) {
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
