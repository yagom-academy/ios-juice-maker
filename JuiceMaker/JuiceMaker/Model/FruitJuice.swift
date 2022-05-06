//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by groot, borysarng on 2022/04/26.
//

enum FruitJuice: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case kiwiJuice = "키위 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case mangoJuice = "망고 쥬스"
    case strawberryAndBananaJuice = "딸바 쥬스"
    case mangoAndKiwiJuice = "망키 쥬스"
    
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
