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
    
    let fruitStore = FruitStore()
    
    let juiceRecipes: [Juice: Recipe] = [
        .strawberry: [.strawberry: 16],
        .banana: [.banana: 2],
        .kiwi: [.kiwi: 3],
        .pineapple: [.pineapple: 2],
        .strawberryBanana: [.strawberry: 10, .banana: 1],
        .mango: [.mango: 3],
        .mangoKiwi: [.mango: 2, .kiwi: 1]
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
        
        print("주스가 완성되었습니다")
    }
    
    func canMakeJuice(recipe: Recipe) -> Bool {
        return recipe.reduce(true) {
            let fruit = $1.key
            let count = $1.value
            return $0 && fruitStore.hasFruitStock(of: fruit, count: count)
        }
    }
}


