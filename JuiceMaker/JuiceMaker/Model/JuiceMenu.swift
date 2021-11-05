//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/26.
//

import Foundation

enum JuiceMenu: Int {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case ddalbaJuice
    case mangKiJuice
    
    var koreanName: String {
        switch self {
        case .bananaJuice: return "바나나쥬스"
        case .ddalbaJuice: return "딸바쥬스"
        case .kiwiJuice: return "키위쥬스"
        case .mangKiJuice: return "망키쥬스"
        case .mangoJuice: return "망고쥬스"
        case .pineappleJuice: return "파인애플쥬스"
        case .strawberryJuice: return "딸기쥬스"
        }
    }
    
    enum IngredientsQuantity {
        static let strawberryOfStrawberryJuice = 16
        static let bananaOfBananaJuice = 2
        static let kiwiOfKiwiJuice = 3
        static let pineappleOfPineappleJuice = 2
        static let mangoOfMangoJuice = 3
        static let strawberryOfDdalbaJuice = 10
        static let bananaOfDdalbaJuice = 1
        static let mangoOfMangKiJuice = 2
        static let kiwiOfMangKiJuice = 1
    }
    
    static let recipe = [JuiceMenu.strawberryJuice: [Fruit(name: .strawberry, quantity: JuiceMenu.IngredientsQuantity.strawberryOfStrawberryJuice)],
                         JuiceMenu.bananaJuice: [Fruit(name: .banana, quantity: JuiceMenu.IngredientsQuantity.bananaOfBananaJuice)],
                         JuiceMenu.kiwiJuice: [Fruit(name: .kiwi, quantity: JuiceMenu.IngredientsQuantity.kiwiOfKiwiJuice)],
                         JuiceMenu.pineappleJuice: [Fruit(name: .pineapple, quantity: JuiceMenu.IngredientsQuantity.pineappleOfPineappleJuice)],
                         JuiceMenu.mangoJuice: [Fruit(name: .mango, quantity: JuiceMenu.IngredientsQuantity.mangoOfMangoJuice)],
                         JuiceMenu.ddalbaJuice: [Fruit(name: .strawberry, quantity: JuiceMenu.IngredientsQuantity.strawberryOfDdalbaJuice),
                          Fruit(name: .banana, quantity: JuiceMenu.IngredientsQuantity.bananaOfDdalbaJuice)],
                         JuiceMenu.mangKiJuice: [Fruit(name: .mango, quantity: JuiceMenu.IngredientsQuantity.mangoOfMangKiJuice),
                          Fruit(name: .kiwi, quantity: JuiceMenu.IngredientsQuantity.kiwiOfMangKiJuice)]]

    var ingredients: [Fruit] {
        guard let ingredient = JuiceMenu.recipe[self] else {
            return []
        }
        return ingredient
    }
}
