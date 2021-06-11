//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum JuiceRecipe: String, CaseIterable {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case mangoJuice = "망고쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBananaJuice = "딸기바나나쥬스"
        case mangoKiwiJuice = "망고키위쥬스"
        
        var recipeIngredients: [Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
                
            case .bananaJuice:
                return [.banana: 2]
                
            case .kiwiJuice:
                return [.kiwi: 3]
                
            case .mangoJuice:
                return [.mango: 3]
                
            case .pineappleJuice:
                return [.pineapple: 2]
                
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
                
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    
    let fruitstore = FruitStore()
    
    func makeJuice(recipe: JuiceRecipe) throws {
        for (fruit, amount) in recipe.recipeIngredients {
            do {
                try fruitstore.usingFruits(fruit: fruit, needs: amount)
            } catch FruitError.outOfStock {
                throw FruitError.outOfStock
                
            }
        }
    }
}
