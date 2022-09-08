enum FruitJuice: String, CaseIterable {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoKiwiJuice = "망키쥬스"
    
    struct JuiceIngridients {
        let first: (Fruits, Int)
        let second: (Fruits, Int)?
    }
    
    var juiceIngridients: JuiceIngridients {
        switch self {
        case .strawberryJuice:
            return JuiceIngridients(first: (.strawberry, 16), second: nil)
        case .bananaJuice:
            return JuiceIngridients(first: (.banana, 2), second: nil)
        case .kiwiJuice:
            return JuiceIngridients(first: (.kiwi, 3), second: nil)
        case .pineappleJuice:
            return JuiceIngridients(first: (.pineapple, 2), second: nil)
        case .mangoJuice:
            return JuiceIngridients(first: (.mango, 3), second: nil)
        case .strawberryBananaJuice:
            return JuiceIngridients(first: (.strawberry, 10), second: (.banana, 1))
        case .mangoKiwiJuice:
            return JuiceIngridients(first: (.mango, 2), second: (.kiwi, 1))
        }
    }
    
    var restorationIdentifier: String {
        switch self {
        case .strawberryJuice:
            return "strawberryJuiceOrderButton"
        case .bananaJuice:
            return "bananaJuiceOrderButton"
        case .kiwiJuice:
            return "kiwiJuiceOrderButton"
        case .pineappleJuice:
            return "pineappleJuiceOrderButton"
        case .mangoJuice:
            return "mangoJuiceOrderButton"
        case .strawberryBananaJuice:
            return "strawberryBananaJuiceOrderButton"
        case .mangoKiwiJuice:
            return "mangoKiwiJuiceOrderButton"
        }
    }
}
