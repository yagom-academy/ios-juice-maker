extension JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice: return [.strawberry: 16]
            case .bananaJuice: return [.banana: 2]
            case .kiwiJuice: return [.kiwi: 3]
            case .pineappleJuice: return [.pineapple: 2]
            case .strawberryBananaJuice: return [.strawberry: 10, .banana: 1]
            case .mangoJuice: return [.mango: 3]
            case .mangoKiwiJuice: return [.mango: 10, .kiwi: 1]
            }
        }
    }
}
