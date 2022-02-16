//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

struct JuiceRecipe {
    let ingredients: [Ingredient]
    let name: RecipeName
    
    enum RecipeName: String, CustomStringConvertible {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case strawberryBanananJuice = "딸바쥬스"
        case mangoJuice = "망고쥬스"
        case mangoKiwiJuice = "망고키위쥬스"
        
        var description: String {
            self.rawValue
        }
    }
    
    init(ingredients: [Ingredient], name: RecipeName) {
        self.ingredients = ingredients
        self.name = name
    }
}
