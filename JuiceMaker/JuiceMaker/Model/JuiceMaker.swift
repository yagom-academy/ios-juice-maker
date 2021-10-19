//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMakerError: Error {
    case fruitNotFound
    case notEnoughFruit
}

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [(Fruit, Int)] {
        switch self {
        case .strawberry:
            return [(.strawberry, 16)]
        case .banana:
            return [(.banana, 2)]
        case .pineapple:
            return [(.pineapple, 2)]
        case .kiwi:
            return [(.kiwi, 3)]
        case .mango:
            return [(.mango, 3)]
        case .strawberryBanana:
            return [(.strawberry, 10), (.banana, 1)]
        case .mangoKiwi:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
}

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    private func hasIngredients(`for` juice: Juice) throws {
        let recipe = juice.recipe
        
        for (fruit, demandingAmount) in recipe {
            guard let leftAmount = fruitStore.inventory[fruit] else {
                throw JuiceMakerError.fruitNotFound
            }
            
            guard leftAmount >= demandingAmount else {
                throw JuiceMakerError.notEnoughFruit
            }
        }
    }
    
    private func consumeIngredients(`for` juice: Juice) throws {
        let recipe = juice.recipe
        
        for (fruit, demandingAmount) in recipe {
            try self.fruitStore.decrease(fruit, amount: demandingAmount)
        }
    }
    
    func make(_ juice: Juice) {
        do {
            try self.hasIngredients(for: juice)
            try consumeIngredients(for: juice)
        } catch {
            return // TODO: 에러 발생 시 어떻게 처리할지 STEP 2 에서 계속...
        }
    }
}
