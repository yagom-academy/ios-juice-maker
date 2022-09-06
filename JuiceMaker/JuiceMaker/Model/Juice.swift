enum Juice: Int {
    case strawberry = 1
    case banana = 2
    case kiwi = 3
    case pineapple = 4
    case mango = 5
    case strawberryBanana = 6
    case mangoKiwi = 7
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기 쥬스"
        case .banana:
            return "바나나 쥬스"
        case .kiwi:
            return "키위 쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .mango:
            return "망고 쥬스"
        case .strawberryBanana:
            return "딸바 쥬스"
        case .mangoKiwi:
            return "망키 쥬스"
        }
    }
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .mango:
            return [.mango: 3]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
