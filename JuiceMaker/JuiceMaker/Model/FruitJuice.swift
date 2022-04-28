enum FruitJuice: String {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryAndBanana
    case mango
    case mangoAndKiwi
    
    func pickUpRecipe() -> (strawberry: Int, banana: Int, kiwi: Int, pineapple: Int, mango: Int) {
        var selectedFruits = (strawberry: 0, banana: 0, kiwi: 0, pineapple: 0, mango: 0)
        
        switch self {
        case .strawberry:
            selectedFruits.strawberry = 16
        case .banana:
            selectedFruits.banana = 2
        case .kiwi:
            selectedFruits.kiwi = 3
        case .pineapple:
            selectedFruits.pineapple = 2
        case .strawberryAndBanana:
            selectedFruits.strawberry = 10
            selectedFruits.banana = 1
        case .mango:
            selectedFruits.mango = 3
        case .mangoAndKiwi:
            selectedFruits.mango = 2
            selectedFruits.kiwi = 1
        }
        return selectedFruits
    }
}
