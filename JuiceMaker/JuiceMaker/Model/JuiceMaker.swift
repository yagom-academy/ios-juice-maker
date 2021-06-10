//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum JuiceRecipe: CaseIterable, CustomStringConvertible {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case mangoJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
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
        
        var description: String {
            switch self {
            case .strawberryJuice:
                return "딸기"
            case .bananaJuice:
                return "바나나"
            case .kiwiJuice:
                return "키위"
            case .mangoJuice:
                return "망고"
            case .pineappleJuice:
                return "파인"
            case .strawberryBananaJuice:
                return "딸바"
            case .mangoKiwiJuice:
                return "망키"
            }
        }
    }
    
    let fruitstore = FruitStore()
    
    func makeJuice(recipe: JuiceRecipe) {
        for (fruit, amount) in recipe.recipeIngredients {
            fruitstore.usingFruits(fruit: fruit, needs: amount)
            print("\(recipe)쥬스 나왔습니다! 맛있게 드세요!")
        }
    }
}
