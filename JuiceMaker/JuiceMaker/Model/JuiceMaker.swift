//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private var fruitStore: Store
    private let juiceRecipes: JuiceRecipes
    private let juiceRecipesMapper: JuiceRecipesMapper
    
    init(fruitStore: Store = FruitStore(), recipes: JuiceRecipes = JuiceRecipes()) {
        self.fruitStore = fruitStore
        self.juiceRecipes = recipes
        self.juiceRecipesMapper = JuiceRecipesMapper(jucieRecipeTypes: JuiceRecipeType.allCases, recipes: juiceRecipes.recipes)
    }

    mutating func increase(fruit: Fruit) throws {
         try fruitStore.increase(in: fruit)
    }
    
    mutating func decrease(fruit: Fruit) throws {
         try fruitStore.decrease(in: fruit)
    }
    
    mutating func takeOrder(recipeType: JuiceRecipeType) throws -> String {
        guard let juiceRecipe = juiceRecipesMapper[recipeType] else {
            throw JuiceMakerError.notFindReceipe
        }
        try fruitStore.makeDrink(of: juiceRecipe.ingredients)
        return juiceRecipe.name.description
    }
    
}
