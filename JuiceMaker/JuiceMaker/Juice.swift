//
//  Juice.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/14.
//

import Foundation

typealias ingredient = (fruit: Fruit, amount: Int)

class JuiceRecipe {
    private(set) var ingredients: [ingredient]
    
    init(ingredients: [ingredient]) {
        self.ingredients = ingredients
    }
}

struct FruitJuice {
    let singleton = FruitStock.sharedInstance
    let strawberryJuice = JuiceRecipe(ingredients: [(singleton.strawberry,16)])
    static let bananaJuice = JuiceRecipe(ingredients: [(FruitStock.banana,2)])
    static let pineappleJuice = JuiceRecipe(ingredients: [(FruitStock.pineapple,2)])
    static let kiwiJuice = JuiceRecipe(ingredients: [(FruitStock.kiwi,3)])
    static let mangoJuice = JuiceRecipe(ingredients: [(FruitStock.mango,3)])
}
