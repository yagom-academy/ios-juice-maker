//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
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
    
    private let fruitStore = FruitStore.shared
    
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
    
    func make(_ juice: Juice) {
        do {
            try self.hasIngredients(of: juice)
            try self.consumeIngredients(of: juice)
        } catch {
            return // TODO: 에러 발생 시 어떻게 처리할지 STEP 2 에서 계속...
        }
    }
}
