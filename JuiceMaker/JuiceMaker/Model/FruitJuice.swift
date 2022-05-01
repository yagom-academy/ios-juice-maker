enum FruitJuice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryAndBanana = "딸기 바나나"
    case mango = "망고"
    case mangoAndKiwi = "망고 키위"
    
    func chooseRecipe() -> Fruits {
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
