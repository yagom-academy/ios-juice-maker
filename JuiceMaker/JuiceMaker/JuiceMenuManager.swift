//
//  JuiceMenuManager.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/09.
//

import Foundation

struct Juice {
  private var name: String
  private(set) var ingredients: [Fruit: Int]
  
  init(nameOf newMenuName: String, need requiredIngredients: [Fruit: Int]) {
    name = newMenuName
    ingredients = requiredIngredients
  }
}

struct Ingredient {
  static let strawberryJuice = [Stock.strawberry: 16]
  static let bananaJuice = [Stock.banana: 2]
  static let kiwiJuice = [Stock.kiwi: 3]
  static let pineapppleJuice = [Stock.pineapple: 2]
  static let mangoJuice = [Stock.mango: 3]
  static let strawberryBananaJuice = [Stock.strawberry: 10, Stock.banana: 1]
  static let mangoKiwiJuice = [Stock.mango: 2, Stock.kiwi: 1]
}

struct Menu {
  static let strawberryJuice = Juice(nameOf: "딸기쥬스", need: Ingredient.strawberryJuice)
  static let bananaJuice = Juice(nameOf: "바나나쥬스", need: Ingredient.bananaJuice)
  static let kiwiJuice = Juice(nameOf: "키위쥬스", need: Ingredient.kiwiJuice)
  static let pineapppleJuice = Juice(nameOf: "파인애플쥬스", need: Ingredient.pineapppleJuice)
  static let mangoJuice = Juice(nameOf: "망고쥬스", need: Ingredient.mangoJuice)
  static let strawberryBananaJuice = Juice(nameOf: "딸바쥬스", need: Ingredient.strawberryBananaJuice)
  static let mangoKiwiJuice = Juice(nameOf: "망키쥬스", need: Ingredient.mangoKiwiJuice)
}
