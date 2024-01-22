//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

typealias Combination = (fruitName: FruitCategory, count: Int)

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: [Combination] {
        switch self {
        case .strawberryJuice:
            return [(FruitCategory.strawberry, Recipe.strawberryJuice.strawberryCount)]
        case .bananaJuice:
            return [(FruitCategory.banana, Recipe.bananaJuice.bananaCount)]
        case .kiwiJuice:
            return [(FruitCategory.kiwi, Recipe.kiwiJuice.kiwiCount)]
        case .pineappleJuice:
            return [(FruitCategory.pineapple, Recipe.pineappleJuice.pineappleCount)]
        case .strawberryBananaJuice:
            return [(FruitCategory.strawberry, Recipe.strawberryBananaJuice.strawberryCount), (FruitCategory.banana, Recipe.strawberryBananaJuice.bananaCount)]
        case .mangoJuice:
            return [(FruitCategory.mango, Recipe.mangoJuice.mangoCount)]
        case .mangoKiwiJuice:
            return [(FruitCategory.mango, Recipe.mangoKiwiJuice.mangoCount), (FruitCategory.kiwi, Recipe.mangoKiwiJuice.kiwiCount)]
        }
    }
}

struct Recipe {
    struct strawberryJuice {
        static let strawberryCount = 16
    }
    
    struct bananaJuice {
        static let bananaCount = 3
    }
    
    struct kiwiJuice {
        static let kiwiCount = 3
    }
    
    struct pineappleJuice {
        static let pineappleCount = 2
    }
    
    struct strawberryBananaJuice {
        static let strawberryCount = 10
        static let bananaCount = 1
    }
    
    struct mangoJuice {
        static let mangoCount = 3
    }
    
    struct mangoKiwiJuice {
        static let mangoCount = 2
        static let kiwiCount = 1
    }
}

struct JuiceMaker {
//    var fruitStore: FruitStore
    mutating func makeJuice(juiceMenu: JuiceMenu) {
        let stockStatus = checkInsufficientStock(recipe: juiceMenu.recipe)
        
        switch stockStatus {
        case .strawberry, .banana, .pineapple, .kiwi, .mango:
            print("\(stockStatus.koreanName)의 재고가 부족합니다.")
        default:
            consumeStock(recipe: juiceMenu.recipe)
        }
    }
}
