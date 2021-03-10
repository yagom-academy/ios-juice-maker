//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/09.
//

import Foundation

struct Recipe: Codable {
    struct JuiceRecipe: Codable {
        struct Ingredient: Codable {
            var fruit: Fruit
            var stock: Int
        }
        
        var name: String
        var ingredient: [Ingredient]
    }
    
    var juiceRecipe: [JuiceRecipe]
}

struct JuiceRecipe {
    private let allRecipe: Recipe
    
    init() {
      guard let jsonData = jsonString.data(using: .utf8) else { fatalError() }
      self.allRecipe = try! JSONDecoder().decode(Recipe.self, from: jsonData)
    }
    
    func ordered(juice: Juice) -> Recipe.JuiceRecipe? {
        let orderedJuice = juice.name
        var recipe: Recipe.JuiceRecipe?

        for juiceRecipe in allRecipe.juiceRecipe {
            if juiceRecipe.name == orderedJuice {
                recipe = juiceRecipe
            }
        }
        
        return recipe
    }
    
    // json파일로 따로 빼낼예정
    let jsonString = """
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
}
