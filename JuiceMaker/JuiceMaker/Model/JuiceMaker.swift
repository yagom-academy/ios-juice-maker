//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case strawberry = "딸기쥬스"
    case banana = "바나나쥬스"
    case kiwi = "키위쥬스"
    case pineapple = "파인애플쥬스"
    case strawberryBanana = "딸바쥬스"
    case mango = "망고쥬스"
    case mangoKiwi = "망키쥬스"
}
 
struct JuiceMaker {
    let fruitStore = FruitStore()
    private let recipe = [
        Juice.strawberry: [Fruit.strawberry: 16],
        Juice.banana: [Fruit.banana: 2],
        Juice.kiwi: [Fruit.kiwi: 3],
        Juice.pineapple: [Fruit.pineapple: 2],
        Juice.strawberryBanana: [Fruit.strawberry: 10, Fruit.banana: 1],
        Juice.mango: [Fruit.mango: 3],
        Juice.mangoKiwi: [Fruit.mango: 2, Fruit.kiwi: 1]
    ]
    
    func orderJuice(name: Juice) {
        guard let ingredients = recipe[name] else {
            return
        }
        fruitStore.makeJuice(for: ingredients)
    }
    
    func returnStockString(of fruit: Fruit) throws -> String {
        guard let stock = fruitStore.fruits[fruit] else {
            throw FruitStoreError.invaildFruit
        }
        return String(stock)
    }
}
