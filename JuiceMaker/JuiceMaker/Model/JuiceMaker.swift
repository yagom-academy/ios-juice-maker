//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMakerError: Error {
    case insufficientIngredients
}

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func verifyIngredientsOf(recipe: [Fruit: Int]) throws {
        for (fruit, quantity) in recipe {
            do {
                try fruitStore.hasEnough(fruit: fruit, quantity: quantity)
            } catch {
                throw JuiceMakerError.insufficientIngredients
            }
        }
    }
    
    func make(juice: Juice) throws {
        let juiceRecipe = juice.recipe
        
        try verifyIngredientsOf(recipe: juiceRecipe)
        
        for (fruit, quantity) in juiceRecipe {
            try? fruitStore.use(fruit: fruit, quantity: quantity)
        }
    }
}
