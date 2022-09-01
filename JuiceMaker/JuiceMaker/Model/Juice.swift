//
//  Juice.swift
//  JuiceMaker
//
//  Created by Kyo, TaeLee on 2022/08/29.
//

typealias RecipeType = (name: Fruit, count: Int)

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
        
    var recipe: [RecipeType] {
        switch self {
        case .strawberryJuice:
            return [(name: .strawberry, count: ConstantUsageFruit.strawberry)]
        case .bananaJuice:
            return [(name: .banana, count: ConstantUsageFruit.banana)]
        case .pineappleJuice:
            return [(name: .pineapple, count: ConstantUsageFruit.pineapple)]
        case .kiwiJuice:
            return [(name: .kiwi, count: ConstantUsageFruit.kiwi)]
        case .mangoJuice:
            return [(name: .mango, count: ConstantUsageFruit.mango)]
        case .strawberryBananaJuice:
            return [(name: .strawberry, count: ConstantUsageFruit.strawberryBanana.strawberry),
                    (name: .banana, count: ConstantUsageFruit.strawberryBanana.banana)]
        case .mangoKiwiJuice:
            return [(name: .mango, count: ConstantUsageFruit.mangoKiwi.mango),
                    (name: .kiwi, count: ConstantUsageFruit.mangoKiwi.kiwi)]
        }
    }
}
