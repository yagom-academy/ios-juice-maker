//  Created by 애종,질리,벨라 on 2022/08/30.

enum Juice: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case kiwiJuice = "키위 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBananaJuice = "딸바 쥬스"
    case mangoJuice = "망고 쥬스"
    case mangoKiwiJuice = "망키 쥬스"
    
    struct Recipe {
        let fruit: Fruit
        let amount: Int
    }
    
    var recipe: [Recipe] {
        switch self {
        case .strawberryJuice:
            return [Recipe(fruit: .strawberry, amount: 16)]
        case .bananaJuice:
            return [Recipe(fruit: .banana, amount: 2)]
        case .kiwiJuice:
            return [Recipe(fruit: .kiwi, amount: 3)]
        case .pineappleJuice:
            return [Recipe(fruit: .pineapple, amount: 2)]
        case .strawberryBananaJuice:
            return [Recipe(fruit: .strawberry, amount: 10), Recipe(fruit: .banana, amount: 1)]
        case .mangoJuice:
            return [Recipe(fruit: .mango, amount: 3)]
        case .mangoKiwiJuice:
            return [Recipe(fruit: .mango, amount: 2), Recipe(fruit: .kiwi, amount: 1)]
        }
    }
}
