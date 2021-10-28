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
    
    static func matchJuice(with selectedNumber: Int) -> JuiceMenu {
        switch selectedNumber {
        case 0: return JuiceMenu.strawberryJuice
        case 1: return JuiceMenu.bananaJuice
        case 3: return  JuiceMenu.kiwiJuice
        case 4: return JuiceMenu.pineappleJuice
        case 5: return JuiceMenu.mangoJuice
        case 6: return JuiceMenu.ddalbaJuice
        case 7: return JuiceMenu.mangKiJuice
        default: return JuiceMenu.strawberryJuice
        }
    }
    
    enum FruitQuantity {
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
    
    var ingredients: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(name: .strawberry,
                          quantity: JuiceMenu.FruitQuantity.strawberryOfStrawberryJuice)]
        case .bananaJuice:
            return [Fruit(name: .banana,
                          quantity: JuiceMenu.FruitQuantity.bananaOfBananaJuice)]
        case .kiwiJuice:
            return [Fruit(name: .kiwi,
                          quantity: JuiceMenu.FruitQuantity.kiwiOfKiwiJuice)]
        case .pineappleJuice:
            return [Fruit(name: .pineapple,
                          quantity: JuiceMenu.FruitQuantity.pineappleOfPineappleJuice)]
        case .mangoJuice:
            return [Fruit(name: .mango,
                          quantity: JuiceMenu.FruitQuantity.mangoOfMangoJuice)]
        case .ddalbaJuice:
            return [Fruit(name: .strawberry,
                          quantity: JuiceMenu.FruitQuantity.strawberryOfDdalbaJuice),
                    Fruit(name: .banana,
                          quantity: JuiceMenu.FruitQuantity.bananaOfDdalbaJuice)]
        case .mangKiJuice:
            return [Fruit(name: .mango,
                          quantity: JuiceMenu.FruitQuantity.mangoOfMangKiJuice),
                    Fruit(name: .kiwi,
                          quantity: JuiceMenu.FruitQuantity.kiwiOfMangKiJuice)]
        }
    }
}
