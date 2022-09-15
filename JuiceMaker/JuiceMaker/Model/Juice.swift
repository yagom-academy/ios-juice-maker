//  Created by som, LJ.

import Foundation

enum Juice: Int {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망고키위쥬스"
        }
    }
    
    var recipeOfJuice: Recipe {
        switch self {
        case .strawberryJuice:
            return Recipe(ingredient: [.strawberry: 16])
        case .bananaJuice:
            return Recipe(ingredient: [.banana: 2])
        case .kiwiJuice:
            return Recipe(ingredient: [.kiwi: 3])
        case .pineappleJuice:
            return Recipe(ingredient: [.pineapple: 2])
        case .strawberryBananaJuice:
            return Recipe(ingredient: [.strawberry: 10, .banana: 1])
        case .mangoJuice:
            return Recipe(ingredient: [.mango: 3])
        case .mangoKiwiJuice:
            return Recipe(ingredient: [.mango: 2, .kiwi: 1])
        }
    }
}
