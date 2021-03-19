//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/09.
//

import Foundation

// MARK: - JuiceRecipe Type
struct JuiceRecipe {
  private let wrappedRecipeBook: Recipe?
  
  init() throws {
    guard let path = Bundle.main.path(forResource: "Recipe", ofType: "json") else {
      throw RecipeError.canNotFindJSONPath
    }
    guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
      throw RecipeError.failedToConvertJSONAsDataFormat
    }
    self.wrappedRecipeBook = try? JSONDecoder().decode(Recipe.self, from: jsonData)
  }
  
  func find(for orderedJuice: Juice) throws -> JuiceType {
    var recipe: JuiceType?
    
    guard let recipeBook = wrappedRecipeBook else {
      throw RecipeError.jsonDecodingFailed
    }
    
    for juiceRecipe in recipeBook.juiceRecipes {
      if juiceRecipe.name == orderedJuice.name {
        recipe = juiceRecipe
      }
    }
    
    guard let unwrappedRecipe = recipe else {
      throw RecipeError.nilHasOccurredWhileUnwrappingRecipe
    }
    
    return unwrappedRecipe
  }
}
