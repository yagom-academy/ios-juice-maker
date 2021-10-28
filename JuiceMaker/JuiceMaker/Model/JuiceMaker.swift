//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMenu: String, CustomStringConvertible, CaseIterable {
    case strawberryJuice = "딸기 쥬스"
    case banannaJuice = "바나나 쥬스"
    case kiwiJuice = "키위 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBanannaJuice = "딸바 쥬스"
    case mangoJuice = "망고 쥬스"
    case mangoKiwiJuice = "망키 쥬스"
    
    var description: String {
        return rawValue
    }
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
