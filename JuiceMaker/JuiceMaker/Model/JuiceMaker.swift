//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMenu {
    case strawberryJuice
    case banannaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBanannaJuice
    case mangoJuice
    case mangoKiwiJuice
}

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(_ juice: JuiceMenu) throws {
        guard hasAllIngredients(of: juice.recipe) else {
            throw FruitStoreError.deficientStock
        }
        
        fruitStore.reduceInventory(ingredientsOf: juice.recipe)
    }
    
    private func hasAllIngredients(of juiceRecipe: JuiceRecipe) -> Bool {
        return fruitStore.canProvideIngredients(of: juiceRecipe)
    }
}

extension JuiceMenu {
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
