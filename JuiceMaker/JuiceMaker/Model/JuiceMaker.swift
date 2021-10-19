//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(juice: JuiceRecipe) throws -> JuiceRecipe {
        let unavailableFruits = getUnavailableFruit(juice: juice)
        
        guard unavailableFruits.count == 0 else {
            throw FruitStoreError.insufficientFruits(unavailabeFruits: unavailableFruits)
        }
        
        for ingredient in juice.ingredients {
            fruitStore.changeInventory(ingredient.fruit, by: ingredient.amount)
        }
        return juice
    }
    
    func getUnavailableFruit(juice: JuiceRecipe) -> [Ingredient] {
        let unavailableFruits = juice.ingredients.filter( {(ingredient: Ingredient) -> Bool in
            return fruitStore.isAvailable(fruit: ingredient.fruit, amount: ingredient.amount) == false
        })
        return unavailableFruits
    }
}

struct Ingredient {
    let fruit: Fruit
    let amount: Int
}

struct JuiceRecipe {
    let ingredients: [Ingredient]
}

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case banannaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBanannaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    
    var recipe: JuiceRecipe {
        switch self {
        case .strawberryJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .strawberry, amount: 16)])
        case .banannaJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .bananna, amount: 2)])
        case .kiwiJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .kiwi, amount: 3)])
        case .pineappleJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .pineapple, amount: 2)])
        case .strawberryBanannaJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .strawberry, amount: 10), Ingredient(fruit: .bananna, amount: 1)])
        case .mangoJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .mango, amount: 3)])
        case .mangoKiwiJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .mango, amount: 2), Ingredient(fruit: .kiwi, amount: 1)])
        }
    }
}


