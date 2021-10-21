//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice

        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .strawberryBananaJuice:
                return [.strawberry: 2, .banana: 1]
            case .mangoJuice:
                return [.mango: 3]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    func orderJuice(for menu: Juice) {
        guard fruitStore.isHaveEnoughStock(for: menu) else { return }
        makeJuice(for: menu)
    }
    func makeJuice(for menu: Juice) {
        for (fruitName, ingredient) in menu.recipe {
            fruitStore.substractFruitStock(fruit: fruitName, minus: ingredient)
        }
    }
}
