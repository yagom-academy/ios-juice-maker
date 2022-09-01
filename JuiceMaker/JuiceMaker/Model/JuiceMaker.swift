//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        struct Recipe {
            let fruit: Fruit
            let amount: Int
        }
        
        var recipe: [Recipe] {
            switch self {
            case .strawberryJuice:
                return [Recipe(fruit: .strawberry, amount: 16)]
            case .bananaJuice:
                return [Recipe(fruit: .banana, amount: 2)]
            case .kiwiJuice:
                return [Recipe(fruit: .kiwi, amount: 3)]
            case .pineappleJuice:
                return [Recipe(fruit: .pineapple, amount: 2)]
            case .strawberryBananaJuice:
                return [Recipe(fruit: .strawberry, amount: 1),
                        Recipe(fruit: .banana, amount: 2)]
            case .mangoJuice:
                return [Recipe(fruit: .mango, amount: 3)]
            case .mangoKiwiJuice:
                return [Recipe(fruit: .mango, amount: 2),
                        Recipe(fruit: .kiwi, amount: 1)]
            }
        }
    }
    
    private let fruitStore = FruitStore()
    
    func produce(juice: Menu) {
        let recipes = juice.recipe
        do {
            try fruitStore.checkStock(for: juice)
            for recipe in recipes {
                fruitStore.use(recipe.fruit, amountOf: recipe.amount)
            }
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다.")
        } catch {
            print("Unexpected error: \(error).")
        }
    }
}
