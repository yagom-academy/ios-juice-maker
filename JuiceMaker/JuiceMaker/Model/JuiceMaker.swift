//
//  JuiceMaker - JuiceMaker.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias JuiceIngredient = Int

struct JuiceMaker {
    enum Juice: String {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        fileprivate var recipe: [FruitStore.Fruit: JuiceIngredient] {
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
                return [.strawberry: 9, .banana: 1]
            case .mangoJuice:
                return [.mango: 3]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
        
        var name: String {
            switch self {
            case .strawberryJuice:
                return "딸기"
            case .bananaJuice:
                return "바나나"
            case .kiwiJuice:
                return "키위"
            case .pineappleJuice:
                return "파인애플"
            case .strawberryBananaJuice:
                return "딸바"
            case .mangoJuice:
                return "망고"
            case .mangoKiwiJuice:
                return "망고키위"
            }
        }
    }
    
    func orderJuice(for menu: Juice) -> Bool {
        var confirmedFruitStock = 0
        let juiceIngredientCounter = menu.recipe.count
        
        for (fruitName, juiceIngredient) in menu.recipe {
            guard (try? stock.isHaveEnoughStock(fruitName: fruitName, juiceIngredient: juiceIngredient)) != nil else {
                return false
            }
            confirmedFruitStock += 1
            guard confirmedFruitStock == juiceIngredientCounter, (try? stock.changeFruitStock(fruitName: fruitName, changingNumber: -juiceIngredient)) != nil else {
                continue
            }
        }
        return true
    }
}
