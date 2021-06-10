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
        Juice.strawberry: ["strawberry": 16],
        Juice.banana: ["banana": 2],
        Juice.kiwi: ["kiwi": 3],
        Juice.pineapple: ["pineapple": 2],
        Juice.strawberryBanana: ["stawberry": 10, "banana": 1],
        Juice.mango: ["mango": 3],
        Juice.mangoKiwi: ["mango": 2, "kiwi": 1]
    ]
    
    func orderJuice(name: Juice) {
        guard let ingredients = recipe[name] else {
            return
        }
        //fruitStore.makeJuice(for: ingredients)
    }
}
