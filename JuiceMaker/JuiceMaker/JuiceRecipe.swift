//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Seungjin Baek on 2021/03/12.
//

import Foundation


typealias FruitTypeAndAmount = [(String, Int)]
typealias RecipeBook = [String:FruitTypeAndAmount]

struct JuiceRecipe {
    private let juiceIngredients: RecipeBook = [
        "strawberryJuice":[("strawberry", 16)],
        "bananaJuice":[("banana", 2)],
        "kiwiJuice":[("kiwi", 3)],
        "pineappleJuice":[("pineapple", 2)],
        "strawberryBananaJuice":[("strawberry", 10), ("banana", 1)],
        "mangoJuice":[("mango", 3)],
        "mangoKiwiJuice":[("mango", 2), ("kiwi", 1)]]
    
    func getJuiceIngredients(of juiceName: String) -> FruitTypeAndAmount? {
        return juiceIngredients[juiceName]
    }
}
