//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Recipe = [FruitStore.Fruit: Int]

struct JuiceMaker {
    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    private let fruitStore = FruitStore()
    private let juiceRecipes: [Juice: Recipe] = [
        Juice.strawberry: [.strawberry: 16],
        Juice.banana: [.banana: 2],
        Juice.kiwi: [.kiwi: 3],
        Juice.pineapple: [.pineapple: 2],
        Juice.strawberryBanana: [.strawberry: 10, .banana: 1],
        Juice.mango: [.mango: 3],
        Juice.mangoKiwi: [.mango: 2, .kiwi: 1]
    ]
    
    func fruitsMixer(juice: Juice) throws {
        guard let recipe = juiceRecipes[juice] else { return }
        guard canMakeJuice(recipe: recipe) else {
            throw RequestError.fruitStockOut
        }
        try recipe.forEach { (fruit, count) in
            try fruitStore.changeAmount(count: count, of: fruit, by: -)
            print("fruit: \(fruit) count: \(count)")
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
