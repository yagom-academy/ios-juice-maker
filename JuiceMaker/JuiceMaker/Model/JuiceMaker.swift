//
//  JuiceMaker - JuiceMaker.swift
//  Created by mireu,charles
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private(set) var fruitStore = FruitStore(fruitStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
    
    private mutating func subtractFruitStock(juice: Juice) throws {
        for (name, count) in juice.recipe {
            try fruitStore.subtractFruitStock(name: name, count: count)
        }
    }
    
    mutating func createJuice(juice: Juice) throws {
            try subtractFruitStock(juice: juice)
    }
}
