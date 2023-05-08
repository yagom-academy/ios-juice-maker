//
//  JuiceMakerEnums.swift
//  JuiceMaker
//
//  Created by qoocrab, Whales on 2023/05/08.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice: String {
    case strawberryJuice = "딸기",
         bananaJuice = "바나나",
         kiwiJuice = "키위",
         pineappleJuice = "파인애플",
         strawNanaJuice = "딸바",
         mangoJuice = "망고",
         mangKiJuice = "망키"
}

enum FruitJuiceError: Error {
    case insufficientFruitStock
    case notFoundFruitInformation
    case notFoundJuiceRecipe
}

enum StockUpdate {
    case consume, order
}
