//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

fileprivate typealias Recipe = [Fruit: Int]

enum Juice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryBanana = "딸바"
    case mango = "망고"
    case mangoKiwi = "망키"
    
    var name: String {
        return rawValue
    }
    
    fileprivate var recipe: Recipe {
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

struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore.shared) {
        self.fruitStore = fruitStore
    }
    
    func mixFruit(juice: Juice) throws {
        let juiceRecipe = juice.recipe
        guard canMakeJuice(recipe: juiceRecipe) else {
            throw RequestError.fruitStockOut
        }
        try juiceRecipe.forEach { (fruit, count) in
            try fruitStore.subtractFruitStock(fruit: fruit, count: count)
        }
    }
    
    private func canMakeJuice(recipe: Recipe) -> Bool {
        return recipe.reduce(true) {
            let fruit = $1.key
            let count = $1.value
            return $0 && fruitStore.hasFruitStock(of: fruit, count: count)
        }
    }
}
