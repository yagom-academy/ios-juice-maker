//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by groot, borysarng on 2022/04/26.
//

enum FruitJuice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryAndBananaJuice
    case mangoAndKiwiJuice
    
    func getRecipe() -> [(Fruit, Int)] {
        switch self {
        case .strawberryJuice:
            return [(.strawberry, 16)]
        case .bananaJuice:
            return [(.banana, 2)]
        case .kiwiJuice:
            return [(.kiwi, 3)]
        case .pineappleJuice:
            return [(.pineapple, 2)]
        case .mangoJuice:
            return [(.mango, 3)]
        case .strawberryAndBananaJuice:
            return [(.strawberry, 10),(.banana, 1)]
        case .mangoAndKiwiJuice:
            return [(.mango, 2),(.kiwi, 1)]
        }
    }
}
