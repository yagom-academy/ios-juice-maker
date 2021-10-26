//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/26.
//

import Foundation

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case mangoJuice = "망고쥬스"
    case ddalbaJuice = "딸바쥬스"
    case mangKiJuice = "망키쥬스"
    
    enum FruitQuintity {
        static let strawberryOfStrawberrJuice = 16
        static let bananaOfBananaJuice = 2
        static let kiwiOfKiwiJuice = 3
        static let pineappleOfPineappleJuice = 2
        static let mangoOfMangoJuice = 3
        static let strawberryOfDdalbaJuice = 10
        static let bananaOfDdalbaJuice = 1
        static let mangoOfMangKiJuice = 2
        static let KiwiOfMangKiJuice = 1
    }
    
    var ingredients: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(name: .strawberry,
                          quantity: JuiceMenu.FruitQuintity.strawberryOfStrawberrJuice)]
        case .bananaJuice:
            return [Fruit(name: .banana,
                          quantity: JuiceMenu.FruitQuintity.bananaOfBananaJuice)]
        case .kiwiJuice:
            return [Fruit(name: .kiwi,
                          quantity: JuiceMenu.FruitQuintity.kiwiOfKiwiJuice)]
        case .pineappleJuice:
            return [Fruit(name: .pineapple,
                          quantity: JuiceMenu.FruitQuintity.pineappleOfPineappleJuice)]
        case .mangoJuice:
            return [Fruit(name: .mango,
                          quantity: JuiceMenu.FruitQuintity.mangoOfMangoJuice)]
        case .ddalbaJuice:
            return [Fruit(name: .strawberry,
                          quantity: JuiceMenu.FruitQuintity.strawberryOfDdalbaJuice),
                    Fruit(name: .banana,
                          quantity: JuiceMenu.FruitQuintity.bananaOfDdalbaJuice)]
        case .mangKiJuice:
            return [Fruit(name: .mango,
                          quantity: JuiceMenu.FruitQuintity.mangoOfMangKiJuice),
                    Fruit(name: .kiwi,
                          quantity: JuiceMenu.FruitQuintity.KiwiOfMangKiJuice)]
        }
    }
}
