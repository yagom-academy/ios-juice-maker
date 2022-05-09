enum FruitJuice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryAndBanana
    case mango
    case mangoAndKiwi
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .strawberryAndBanana:
            return "딸바"
        case .mango:
            return "망고"
        case .mangoAndKiwi:
            return "망키"
        }
    }
    
    var recipe: Fruits {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryAndBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoAndKiwi:
            return [.kiwi: 1, .mango: 2]
        }
    }
}
