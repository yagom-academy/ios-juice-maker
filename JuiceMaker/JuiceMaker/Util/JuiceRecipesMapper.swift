//
//  JuiceRecipesMapper.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

struct JuiceRecipesMapper {
    private let mapping: [JuiceRecipeType: JuiceRecipe]
    
    init(jucieRecipeTypes: [JuiceRecipeType], recipes: [JuiceRecipe]) {
        self.mapping = Dictionary(uniqueKeysWithValues: zip(jucieRecipeTypes, recipes))
    }
    
    subscript(recipeType: JuiceRecipeType) -> JuiceRecipe? {
        return mapping[recipeType]
    }
}
