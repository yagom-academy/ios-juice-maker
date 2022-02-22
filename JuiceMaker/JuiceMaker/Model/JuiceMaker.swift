//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func selectMenu(_ juice: Juice) {

        switch juice {
        case .strawberryJuice:
            makeJuice(Juice.strawberryJuice.recipe)
        case .bananaJuice:
            makeJuice(Juice.bananaJuice.recipe)
        case .kiwiJuice:
            makeJuice(Juice.kiwiJuice.recipe)
        case .pineappleJuice:
            makeJuice(Juice.pineappleJuice.recipe)
        case .strawberryBananaJuice:
            makeJuice(Juice.strawberryBananaJuice.recipe)
        case .mangoJuice:
            makeJuice(Juice.mangoJuice.recipe)
        case .mangoKiwiJuice:
            makeJuice(Juice.mangoKiwiJuice.recipe)
        }
    }
    
    func makeJuice(_ recipe: [FruitType: Int]) {
        for (fruit, _ ) in FruitStore.fruitList {
            guard let fruitStock = FruitStore.fruitList[fruit] else {
                return
            }
            guard let requiredQuantity = recipe[fruit] else {
                return
            }
            guard fruitStock >= requiredQuantity else { return }
            FruitStore.fruitList[fruit] = fruitStock - requiredQuantity
        }
    }
}
