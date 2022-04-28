enum FruitJuice: String {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryAndBanana
    case mango
    case mangoAndKiwi
    
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
