enum Menu: Int {
    case strawberryJuice = 0
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    func returnRecipe() -> [(Fruit, Int)] {
        switch self {
        case .strawberryJuice:
            return [(Fruit.strawberry, 16)]
        case .bananaJuice:
            return [(Fruit.banana, 2)]
        case .pineappleJuice:
            return [(Fruit.pineapple, 2)]
        case .kiwiJuice:
            return [(Fruit.kiwi, 3)]
        case .mangoJuice:
            return [(Fruit.mango, 3)]
        case .strawberryBananaJuice:
            return [(Fruit.strawberry, 10), (Fruit.banana, 1)]
        case .mangoKiwiJuice:
            return [(Fruit.mango, 2), (Fruit.kiwi, 1)]
        }
    }
}
