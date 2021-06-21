//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    enum Juice: Int {
        case strawnana, mangokiwi, strawberry, banana, pineapple, kiwi, mango
        
        var name: String {
            switch self {
            case .strawnana:
                return "딸바쥬스"
            case .mangokiwi:
                return "망키쥬스"
            case .strawberry:
                return "딸기쥬스"
            case .banana:
                return "바나나쥬스"
            case .pineapple:
                return "파인애플쥬스"
            case .kiwi:
                return "키위쥬스"
            case .mango:
                return "망고쥬스"
            }
        }
        
        var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawnana:
                return [.strawberry: 10, .banana: 1]
            case .mangokiwi:
                return [.mango: 2, .kiwi: 1]
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case .pineapple:
                return [.pineapple: 2]
            case .kiwi:
                return [.kiwi: 3]
            case .mango:
                return [.mango: 3]
            }
        }
    }
    
    private(set) var fruitStore: FruitStore
    static let juiceMaker = JuiceMaker(fruitStore: FruitStore(initialStock: 10))
    
    func make(_ juice: Juice) {
        fruitStore.decrease(fruits: juice.recipe)
    }
    
    func checkStockPresence (_ juice: JuiceMaker.Juice) throws -> Bool {
        var hasFruitStock = true
        for recipe in juice.recipe {
            guard let fruitStock: Int = fruitStore.fruits[recipe.key] else
            {
                throw JuiceMakerError.invalidFruit
            }
            hasFruitStock = hasFruitStock && fruitStock >= recipe.value
        }
        return hasFruitStock
    }
}
