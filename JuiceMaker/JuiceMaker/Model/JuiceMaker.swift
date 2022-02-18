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
    
    mutating func takeOrder(recipeType: JuiceRecipeType) throws -> String {
        guard let juiceRecipe = juiceRecipesMapper[recipeType] else {
            throw JuiceMakerError.notFindReceipe
        }
        if !fruitStore.checkStock(of: juiceRecipe.ingredients) {
            throw JuiceMakerError.notEnough
        }
        fruitStore.makeDrink(of: juiceRecipe.ingredients)
        return juiceRecipe.name.description
    }
    
}
