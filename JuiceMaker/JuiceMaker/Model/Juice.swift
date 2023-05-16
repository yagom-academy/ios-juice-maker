//
//  Recipe.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/08.
//

enum Juice: String {
    case strawberryJuice = "딸기쥬스 주문"
    case bananaJuice = "바나나쥬스 주문"
    case pineappleJuice = "파인애플쥬스 주문"
    case kiwiJuice = "키위쥬스 주문"
    case mangoJuice = "망고쥬스 주문"
    case strawberryBananaJuice = "딸바쥬스 주문"
    case mangoKiwiJuice = "망키쥬스 주문"
    
    struct Ingredient {
        let name: Fruit
        let quantity: Int
    }
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [Ingredient(name: .strawberry, quantity: 16)]
        case .bananaJuice:
            return [Ingredient(name: .banana, quantity: 2)]
        case .kiwiJuice:
            return [Ingredient(name: .kiwi, quantity: 3)]
        case .pineappleJuice:
            return [Ingredient(name: .pineapple, quantity: 2)]
        case .strawberryBananaJuice:
            return [Ingredient(name: .strawberry, quantity: 10),
                    Ingredient(name: .banana, quantity: 1)]
        case .mangoJuice:
            return [Ingredient(name: .mango, quantity: 3)]
        case .mangoKiwiJuice:
            return [Ingredient(name: .mango, quantity: 2),
                    Ingredient(name: .kiwi, quantity: 1)]
        }
    }
    
    var koreanName: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
}
