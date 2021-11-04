//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    enum Juice: String {
        case strawberryJuice = "딸기 쥬스"
        case bananaJuice = "바나나 쥬스"
        case pineappleJuice = "파인애플 쥬스"
        case kiwiJuice = "키위 쥬스"
        case mangoJuice = "망고 쥬스"
        case strawberryBananaJuice = "딸바 쥬스"
        case mangoKiwiJuice = "망키 쥬스"
        
        fileprivate var recipe: [(Fruit, Int)] {
            switch self {
            case .strawberryJuice:
                return [(.strawberry, 16)]
            case .bananaJuice:
                return [(.banana, 2)]
            case .pineappleJuice:
                return [(.pineapple, 2)]
            case .kiwiJuice:
                return [(.kiwi, 3)]
            case .mangoJuice:
                return [(.mango, 3)]
            case .strawberryBananaJuice:
                return [(.strawberry, 10), (.banana, 1)]
            case .mangoKiwiJuice:
                return [(.mango, 2), (.kiwi, 1)]
            }
        }
    }
    
    private func hasIngredients(of juice: Juice) throws {
        let recipe = juice.recipe

        for (fruit, demandingAmount) in recipe {
            try self.fruitStore.has(fruit, amount: demandingAmount)
        }
    }
    
    private func consumeIngredients(of juice: Juice) throws {
        let recipe = juice.recipe
        
        for (fruit, demandingAmount) in recipe {
            try self.fruitStore.decrease(fruit, amount: demandingAmount)
        }
    }
    
    func make(_ juice: Juice) throws {
        try self.hasIngredients(of: juice)
        try self.consumeIngredients(of: juice)
    }
}
