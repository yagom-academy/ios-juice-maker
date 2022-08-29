//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func manufactorJuice(menu: Juice) {
        switch menu {
        case .strawberryJuice:
            fruitStore.substractFruits(juice: .strawberryJuice)
        case .bananaJuice:
            fruitStore.substractFruits(juice: .bananaJuice)
        case .pineappleJuice:
            fruitStore.substractFruits(juice: .pineappleJuice)
        case .kiwiJuice:
            fruitStore.substractFruits(juice: .kiwiJuice)
        case .mangoJuice:
            fruitStore.substractFruits(juice: .mangoJuice)
        case .strawberryBananaJuice:
            fruitStore.substractFruits(juice: .strawberryBananaJuice)
        case .mangoKiwiJuice:
            fruitStore.substractFruits(juice: .mangoKiwiJuice)
        }
    }
    
    func checkStock(juice: Juice) throws -> Bool {
        for fruit in juice.recipe {
            guard let stock =  fruitStore.fruitStock[fruit.name], stock > fruit.count else {
                throw JuiceMakerError.outOfStock
            }
        }
        return true
    }
}
