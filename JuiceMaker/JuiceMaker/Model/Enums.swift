enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum FruitJuice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    struct JuiceIngridients {
        let first: (Fruits, Int)
        let second: (Fruits, Int)?
    }
//    struct JuiceIngridientsOfOne
    
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
}

enum ErrorHandling: Error {
    case underFlowOfAmount
    case notExistFruits
}
