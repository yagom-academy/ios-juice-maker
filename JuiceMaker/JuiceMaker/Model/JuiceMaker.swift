//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}
 
struct JuiceMaker {
    private let fruitStore = FruitStore()
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
}
