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

// MARK: - json파일로 따로 빼낼예정
private let jsonString = """
    {
        "juiceRecipes":
        [
            {
                "name": "딸기쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Strawberry",
                        "quantity": 16
                    }
                ]
            },
            {
                "name": "바나나쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Banana",
                        "quantity": 2
                    }
                ]
            },
            {
                "name": "키위쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Kiwi",
                        "quantity": 3
                    }
                ]
            },
            {
                "name": "파인애플쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Pineapple",
                        "quantity": 2
                    }
                ]
            },
            {
                "name": "딸바쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Strawberry",
                        "quantity": 10
                    },
                    {
                        "fruitName": "Banana",
                        "quantity": 1
                    }
                ]
            },
            {
                "name": "망고쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Mango",
                        "quantity": 3
                    }
                ]
            },
            {
                "name": "망고키위쥬스",
                "ingredient":
                [
                    {
                        "fruitName": "Mango",
                        "quantity": 2
                    },
                    {
                        "fruitName": "Kiwi",
                        "quantity": 1
                    }
                ]
            }
        ]
    }
"""
