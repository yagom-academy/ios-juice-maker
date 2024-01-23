//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

typealias Ingredient = (fruitName: FruitCategory, count: Int)

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

struct Recipe {
    var strawberryJuice = [(FruitCategory.strawberry, 16)]
    var bananaJuice = [(FruitCategory.banana, 3)]
    var kiwiJuice = [(FruitCategory.kiwi, 3)]
    var pineappleJuice = [(FruitCategory.pineapple, 2)]
    var strawberryBananaJuice = [(FruitCategory.strawberry, 10), (FruitCategory.banana, 1)]
    var mangoJuice = [(FruitCategory.mango, 3)]
    var mangoKiwiJuice = [(FruitCategory.mango, 2), (FruitCategory.kiwi, 1)]
}

struct JuiceMaker {
    let recipe = Recipe()
    
    mutating func makeJuice(juiceMenu: JuiceMenu) {
        switch juiceMenu {
        case .strawberryJuice:
            if checkSufficientStock(recipe: recipe.strawberryJuice) {
                consumeStock(recipe: recipe.strawberryJuice)
            }
        case .strawberryBananaJuice:
            if checkSufficientStock(recipe: recipe.strawberryBananaJuice) {
                consumeStock(recipe: recipe.strawberryBananaJuice)
            }
        case .bananaJuice:
            if checkSufficientStock(recipe: recipe.bananaJuice) {
                consumeStock(recipe: recipe.bananaJuice)
            }
        case .pineappleJuice:
            if checkSufficientStock(recipe: recipe.pineappleJuice) {
                consumeStock(recipe: recipe.pineappleJuice)
            }
        case .kiwiJuice:
            if checkSufficientStock(recipe: recipe.kiwiJuice) {
                consumeStock(recipe: recipe.kiwiJuice)
            }
        case .mangoJuice:
            if checkSufficientStock(recipe: recipe.mangoJuice) {
                consumeStock(recipe: recipe.mangoJuice)
            }
        case .mangoKiwiJuice:
            if checkSufficientStock(recipe: recipe.mangoKiwiJuice) {
                consumeStock(recipe: recipe.mangoKiwiJuice)
            }
        }
    }
}
