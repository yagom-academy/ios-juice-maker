//
//  JuiceMaker - JuiceMaker.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    typealias JuiceIngredient = Int
    
    var fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice

        var recipe: [FruitStore.Fruit: JuiceIngredient] {
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
        do {
            try fruitStore.isHaveEnoughStock(for: menu)
        } catch {
            print("재고 없음")
        }
        makeJuice(for: menu)
    }
    
    func makeJuice(for menu: Juice) {
        for (fruitName, juiceIngredient) in menu.recipe {
            do {
                try fruitStore.changeFruitStock(fruitName: fruitName, changingNumber: juiceIngredient)
            } catch {
            print("쥬스 만들기 실패")
            }
        }
    }
}
