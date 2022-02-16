//
//  JucieRecipes.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

protocol Recipes {
    var recipes: [JuiceRecipe] { get }
}

struct JucieRecipes: Recipes {
    let recipes: [JuiceRecipe]
    
    init(recipes: [JuiceRecipe]) {
        self.recipes = recipes
    }
    
    init() {
        self.recipes = [
            JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 16)], name: .strawberryJuice),
            JuiceRecipe(ingredients: [.init(fruit: .banana, number: 2)], name: .bananaJuice),
            JuiceRecipe(ingredients: [.init(fruit: .kiwi, number: 3)], name: .kiwiJuice),
            JuiceRecipe(ingredients: [.init(fruit: .pineapple, number: 2)], name: .pineappleJuice),
            JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 10),
                                      .init(fruit: .banana, number: 1)], name: .strawberryBanananJuice),
            JuiceRecipe(ingredients: [.init(fruit: .mango, number: 3)], name: .mangoJuice),
            JuiceRecipe(ingredients: [.init(fruit: .mango, number: 2),
                                      .init(fruit: .kiwi, number: 1)], name: .mangoKiwiJuice)
        ]
    }
}
