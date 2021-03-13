//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/09.
//

import Foundation

// MARK: - JuiceRecipe Type
struct JuiceRecipe {
  private let wrappedRecipeBook: Recipe?
  
  init() {
    let jsonData = Data(jsonString.utf8)
    self.wrappedRecipeBook = try? JSONDecoder().decode(Recipe.self, from: jsonData)
  }
  
  func find(for juice: Juice) throws -> JuiceType? {
    let orderedJuice = juice.name
    var recipe: JuiceType?
    
    guard let recipeBook = wrappedRecipeBook else {
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

// MARK: - Recipe, JuiceType, Ingredient Type
/// JSON 파일을 디코딩하기 위한 Struct
struct Recipe: Decodable {
  var juiceRecipes: [JuiceType]
}

struct JuiceType: Decodable {
  var name: String
  var ingredient: [Ingredient]
}

struct Ingredient: Decodable {
  var fruitName: Fruit
  var quantity: Int
}

