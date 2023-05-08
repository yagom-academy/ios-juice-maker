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
    case strawberry = "딸기",
         banana = "바나나",
         kiwi = "키위",
         pineapple = "파인애플",
         strawNana = "딸바",
         mango = "망고",
         mangKi = "망키"
}

enum FruitJuiceError: Error {
    case insufficientFruitStock
    case notFoundFruitInformation
}
