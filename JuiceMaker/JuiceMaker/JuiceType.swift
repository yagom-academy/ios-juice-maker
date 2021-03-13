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
  
  func find(for orderedJuice: Juice) throws -> JuiceType {
    var recipe: JuiceType?
    
    guard let recipeBook = wrappedRecipeBook else {
      informErrorLocation(functionName: #function)
      throw RecipeError.invalidRecipe
    }
    
    for juiceRecipe in recipeBook.juiceRecipes {
      if juiceRecipe.name == orderedJuice.name {
        recipe = juiceRecipe
      }
    }
    
    guard let unwrappedRecipe = recipe else {
      informErrorLocation(functionName: #function)
      throw RecipeError.invalidRecipe
    }
    
    return unwrappedRecipe
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
  var fruitName: Fruit?
  var quantity: Int?
  
  private enum CodingKeys: String, CodingKey {
    case fruitName
    case quantity
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.fruitName = try? container.decode(Fruit.self, forKey: .fruitName)
    self.quantity = try? container.decode(Int.self, forKey: .quantity)
  }
}
