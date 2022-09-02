//  Created by 애종,질리,벨라 on 2022/08/30.

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    struct Recipe {
        let name: Fruit
        let amount: Int
    }
    
    var recipe: [Recipe] {
        switch self {
        case .strawberryJuice:
            return [Recipe(name: .strawberry, amount: 16)]
        case .bananaJuice:
            return [Recipe(name: .banana, amount: 2)]
        case .kiwiJuice:
            return [Recipe(name: .kiwi, amount: 3)]
        case .pineappleJuice:
            return [Recipe(name: .pineapple, amount: 2)]
        case .strawberryBananaJuice:
            return [Recipe(name: .strawberry, amount: 10), Recipe(name: .banana, amount: 1)]
        case .mangoJuice:
            return [Recipe(name: .mango, amount: 3)]
        case .mangoKiwiJuice:
            return [Recipe(name: .mango, amount: 2), Recipe(name: .kiwi, amount: 1)]
        }
    }
}
