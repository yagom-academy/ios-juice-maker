//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/09.
//

import Foundation

struct JuiceRecipe {
    private let recipeBook: Recipe
    
    init() {
        guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
        self.recipeBook = try! JSONDecoder().decode(Recipe.self, from: jsonData)
    }
    
    func find(for juice: Juice) -> Recipe.JuiceRecipe? {
        let orderedJuice = juice.name
        var recipe: Recipe.JuiceRecipe?
        
        for juiceRecipe in recipeBook.juiceRecipes {
            if juiceRecipe.name == orderedJuice {
                recipe = juiceRecipe
            }
        }
        
        return recipe
    }
}

/// json파일을 Codable로 가져오기위한 Struct
struct Recipe: Codable {
    struct JuiceRecipe: Codable {
        struct Ingredient: Codable {
            var fruitName: Fruit
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
    "juiceRecipe":
    [
        {
            "name": "딸기쥬스",
            "ingredient":
            [
                {
                    "fruit": "Strawberry",
                    "stock": 16
                }
            ]
        },
        {
            "name": "바나나쥬스",
            "ingredient":
            [
                {
                    "fruit": "Banana",
                    "stock": 2
                }
            ]
        },
        {
            "name": "키위쥬스",
            "ingredient":
            [
                {
                    "fruit": "Kiwi",
                    "stock": 3
                }
            ]
        },
        {
            "name": "파인애플쥬스",
            "ingredient":
            [
                {
                    "fruit": "Pineapple",
                    "stock": 2
                }
            ]
        },
        {
            "name": "딸바쥬스",
            "ingredient":
            [
                {
                    "fruit": "Strawberry",
                    "stock": 10
                },
                {
                    "fruit": "Banana",
                    "stock": 1
                }
            ]
        },
        {
            "name": "망고쥬스",
            "ingredient":
            [
                {
                    "fruit": "Mango",
                    "stock": 3
                }
            ]
        },
        {
            "name": "망고키위쥬스",
            "ingredient":
            [
                {
                    "fruit": "Mango",
                    "stock": 2
                },
                {
                    "fruit": "Kiwi",
                    "stock": 1
                }
            ]
        }
    ]
}
"""

