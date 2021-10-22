//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/20.
//

import Foundation

struct JuiceRecipe {
    let ingredients: [Ingredient]
}

struct Ingredient {
    let fruit: Fruit
    let amount: Int
}
