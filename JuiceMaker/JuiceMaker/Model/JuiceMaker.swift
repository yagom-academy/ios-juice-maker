//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
class JuiceMaker: FruitStore {
    
    enum Recipe {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryAndBananaJuice
        case mangoAndKiwiJuice
        
        func getRecipe() -> [(Fruit, Int)] {
            switch self {
            case .strawberryJuice:
                return [(FruitStore.Fruit.strawberry, 16)]
            case .bananaJuice:
                return [(FruitStore.Fruit.banana, 2)]
            case .pineappleJuice:
                return [(FruitStore.Fruit.pineapple, 2)]
            case .kiwiJuice:
                return [(FruitStore.Fruit.kiwi, 3)]
            case .mangoJuice:
                return [(FruitStore.Fruit.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(FruitStore.Fruit.strawberry, 10), (FruitStore.Fruit.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(FruitStore.Fruit.mango, 2), (FruitStore.Fruit.kiwi, 1)]
                
            }
        }
    }
    
    struct Juice {
        let juiceName: String
        let recipe: [(Fruit, Int)]
        
        init(name: String, recipe: [(Fruit, Int)] ) {
            self.juiceName = name
            self.recipe = recipe
        }
    }
    
    let strawberryJuice = Juice(name: "딸기주스", recipe: Recipe.strawberryJuice.getRecipe())
    let bananaJuice = Juice(name: "바나나주스", recipe: Recipe.bananaJuice.getRecipe())
    let pineappleJuice = Juice(name: "파인애플주스", recipe: Recipe.pineappleJuice.getRecipe())
    let kiwiJuice = Juice(name: "키위주스", recipe: Recipe.kiwiJuice.getRecipe())
    let mangoJuice = Juice(name: "망고주스", recipe: Recipe.mangoJuice.getRecipe())
    let strawberryAndBananaJuice = Juice(name: "딸바주스", recipe: Recipe.strawberryAndBananaJuice.getRecipe())
    let mangoAndKiwiJuice = Juice(name: "망고키위주스", recipe: Recipe.mangoAndKiwiJuice.getRecipe())
    
}
