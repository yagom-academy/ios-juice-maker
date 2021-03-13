//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/09.
//

import Foundation

// MARK: - JuiceRecipe Type
struct JuiceRecipe {
  private let wrapedRecipeBook: Recipe?
  
  init() {
    let jsonData = Data(jsonString.utf8)
    self.wrapedRecipeBook = try? JSONDecoder().decode(Recipe.self, from: jsonData)
  }
  
  func find(for juice: Juice) throws -> Recipe.JuiceRecipe? {
    let orderedJuice = juice.name
    var recipe: Recipe.JuiceRecipe?
    
    guard let recipeBook = wrapedRecipeBook else {
      throw RecipeError.invalidRecipe
    }
    
    for juiceRecipe in recipeBook.juiceRecipes {
      if juiceRecipe.name == orderedJuice {
        recipe = juiceRecipe
      }
    }
    
    return recipe
  }
}

// MARK: - Codable Struct
/// json파일을 Codable로 가져오기위한 Struct
struct Recipe: Codable {
  struct JuiceRecipe: Codable {
    struct Ingredient: Codable {
      var fruitName: String
      var quantity: Int
    }
    
    var name: String
    var ingredient: [Ingredient]
  }
  
  var juiceRecipes: [JuiceRecipe]
}
