enum FruitJuice: String, CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var menuName: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
    
    var ingredients: [Fruits: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
//    struct JuiceIngridients {
//        let first: (Fruits, Int)
//        let second: (Fruits, Int)?
//    }
//
//    var juiceIngridients: JuiceIngridients {
//        switch self {
//        case .strawberryJuice:
//            return JuiceIngridients(first: (.strawberry, 16), second: nil)
//        case .bananaJuice:
//            return JuiceIngridients(first: (.banana, 2), second: nil)
//        case .kiwiJuice:
//            return JuiceIngridients(first: (.kiwi, 3), second: nil)
//        case .pineappleJuice:
//            return JuiceIngridients(first: (.pineapple, 2), second: nil)
//        case .mangoJuice:
//            return JuiceIngridients(first: (.mango, 3), second: nil)
//        case .strawberryBananaJuice:
//            return JuiceIngridients(first: (.strawberry, 10), second: (.banana, 1))
//        case .mangoKiwiJuice:
//            return JuiceIngridients(first: (.mango, 2), second: (.kiwi, 1))
//        }
//    }
//
//    var ingridientCount: Int {
//        switch self {
//        case .strawberryJuice, .bananaJuice, .kiwiJuice, .pineappleJuice, .mangoJuice:
//            return 1
//        case .strawberryBananaJuice, .mangoKiwiJuice:
//            return 2
//        }
//    }
    
    var orderButtonID: String {
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
