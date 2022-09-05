//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Juice: Int {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        struct Recipe {
            let ingredient: [Fruit: Int]
        }
        
        var recipe: Recipe {
            switch self {
            case .strawberryJuice:
                return Recipe(ingredient: [.strawberry: 16])
            case .bananaJuice:
                return Recipe(ingredient: [.banana: 2])
            case .kiwiJuice:
                return Recipe(ingredient: [.kiwi: 3])
            case .pineappleJuice:
                return Recipe(ingredient: [.pineapple: 2])
            case .strawberryBananaJuice:
                return Recipe(ingredient: [.strawberry: 10, .banana: 1])
            case .mangoJuice:
                return Recipe(ingredient: [.mango: 3])
            case .mangoKiwiJuice:
                return Recipe(ingredient: [.mango: 2, .kiwi: 1])
            }
        }
    }
    
    private let fruitStore = FruitStore()
    
    func produce(juice: Juice) {
        let recipe = juice.recipe
        do {
            try fruitStore.checkStock(for: juice)
            for (fruit, amount) in recipe.ingredient {
                fruitStore.use(fruit, amountOf: amount)
            }
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다.")
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    func fetchStock(of fruit: Fruit) throws -> Int {
        return try fruitStore.fetchStock(of: fruit)
    }
}
