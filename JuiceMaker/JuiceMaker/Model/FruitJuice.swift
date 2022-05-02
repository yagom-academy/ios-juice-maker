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
            return "딸기 바나나"
        case .mango:
            return "망고"
        case .mangoAndKiwi:
            return "망고 키위"
        }
    }
    
    var recipe: Fruits {
        switch self {
        case .strawberry:
            return Fruits(strawberry: 16)
        case .banana:
            return Fruits(banana: 2)
        case .kiwi:
            return Fruits(kiwi: 3)
        case .pineapple:
            return Fruits(pineapple: 2)
        case .strawberryAndBanana:
            return Fruits(strawberry: 10, banana: 1)
        case .mango:
            return Fruits(mango: 3)
        case .mangoAndKiwi:
            return Fruits(kiwi: 1, mango: 2)
        }
    }
}
