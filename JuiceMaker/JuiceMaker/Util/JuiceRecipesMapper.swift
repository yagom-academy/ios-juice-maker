//
//  JuiceRecipesMapper.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

struct JuiceRecipesMapper {
    private let mapping: [JuiceRecipeType: JuiceRecipe]
    
    init(jucieType: [JuiceRecipeType], recipes: [JuiceRecipe]) {
        self.mapping = Dictionary(uniqueKeysWithValues: zip(jucieType, recipes))
    }
    
    subscript(recipeType: JuiceRecipeType) -> JuiceRecipe? {
        return mapping[recipeType]
    }
}
