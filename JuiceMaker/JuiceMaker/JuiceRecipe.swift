//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Seungjin Baek on 2021/03/12.
//

import Foundation


typealias FruitTypeAndAmount = [(String, Int)]

protocol RecipeBook {
    var menuName: String { get }
    static func recipeIngredients(of juiceName: Self) -> FruitTypeAndAmount
}


enum JuiceRecipe: RecipeBook {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawbeeryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var menuName: String {
        switch self {
        case .strawberryJuice:
            return "strawberry"
        case .bananaJuice:
            return "banana"
        case .kiwiJuice:
            return "kiwi"
        case .pineappleJuice:
            return "pineapple"
        case .strawbeeryBananaJuice:
            return "strawberryBanana"
        case .mangoJuice:
            return "mango"
        case .mangoKiwiJuice:
            return "mangoKiwi"
        }
    }
    
    static func recipeIngredients(of juiceType: Self) -> FruitTypeAndAmount {
        switch juiceType {
        case .strawberryJuice:
            return [("strawberry", 16)]
        case .bananaJuice:
            return [("banana", 2)]
        case .kiwiJuice:
            return [("kiwi", 3)]
        case .pineappleJuice:
            return [("pineapple", 2)]
        case .strawbeeryBananaJuice:
            return [("strawberry", 10), ("banana", 1)]
        case .mangoJuice:
            return [("mango", 3)]
        case .mangoKiwiJuice:
            return [("mango", 2), ("kiwi", 1)]
        }
    }
    
    static func getJuiceIngredients(of juiceType: Self) -> FruitTypeAndAmount {
        return recipeIngredients(of: juiceType)
    }
}

