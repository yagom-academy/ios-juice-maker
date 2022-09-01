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
            return [(name: .strawberry, count: ConstantNameSpace.usageStrawberry)]
        case .bananaJuice:
            return [(name: .banana, count: ConstantNameSpace.usageBanana)]
        case .pineappleJuice:
            return [(name: .pineapple, count: ConstantNameSpace.usagePineapple)]
        case .kiwiJuice:
            return [(name: .kiwi, count: ConstantNameSpace.usageKiwi)]
        case .mangoJuice:
            return [(name: .mango, count: ConstantNameSpace.usageMango)]
        case .strawberryBananaJuice:
            return [(name: .strawberry, count: ConstantNameSpace.usageStrawberryBanana.strawberry),
                    (name: .banana, count: ConstantNameSpace.usageStrawberryBanana.banana)]
        case .mangoKiwiJuice:
            return [(name: .mango, count: ConstantNameSpace.usageMangoKiwi.mango),
                    (name: .kiwi, count: ConstantNameSpace.usageMangoKiwi.kiwi)]
        }
    }
}
