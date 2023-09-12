//
//  Error.swift
//  JuiceMaker
//
//  Created by hisop, morgan on 2023/09/12.
//

enum Fruit: String {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

enum Menu: String {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}


enum OrderFail: Error {
    case wrongInput
    case lackIngredient
    case noMenu
}

