//
//  JuiceMaker - JuiceMaker.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    
    let fruitStore = FruitStore.shared
    
    enum Recipe {
        static let usingStrawberry = 16
        static let usingBanana = 2
        static let usingKiwi = 3
        static let usingPineapple = 2
        static let usingMango = 3
        static let usingMixStrawberry = 10
        static let usingMixBanana = 1
        static let usingMixMango = 2
        static let usingMixKiwi = 1
    }
    
    func makeJuice(juice: Juice) {
        switch juice {
        case .strawberryJuice:
            fruitStore.useFruits(fruits: .strawberry, count: Recipe.usingStrawberry)
        case .bananaJuice:
            fruitStore.useFruits(fruits: .banana, count: Recipe.usingBanana)
        case .pineappleJuice:
            fruitStore.useFruits(fruits: .pineapple, count: Recipe.usingPineapple)
        case .kiwiJuice:
            fruitStore.useFruits(fruits: .kiwi, count: Recipe.usingKiwi)
        case .mangoJuice:
            fruitStore.useFruits(fruits: .mango, count: Recipe.usingMango)
        case .strawberryBananaJuice:
            fruitStore.useFruits(fruits: .strawberry, count: Recipe.usingMixStrawberry)
            fruitStore.useFruits(fruits: .banana, count: Recipe.usingMixBanana)
        case .mangoKiwiJuice:
            fruitStore.useFruits(fruits: .mango, count: Recipe.usingMixMango)
            fruitStore.useFruits(fruits: .kiwi, count: Recipe.usingMixKiwi)
        }
    }
    
}
