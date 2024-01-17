//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitStoreError: Error {
    case fruitNotFound
    case outOfStock
}

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
// 과일 저장소 타입
class FruitStore {
    var fruitsStock: Dictionary<Fruit, Int> = [:]

    init() {
        for fruit in Fruit.allCases {
            fruitsStock[fruit] = 10
        }
    }
    
    func fillStock(fruit: Fruit, quantity: Int) throws {
        fruitsStock[fruit] = try takeStock(fruit: fruit) + quantity
    }
    
    func consumeStock(fruit: Fruit, quantity: Int) throws {
        try checkStock(fruit: fruit, quantity: quantity)
        fruitsStock[fruit] = try takeStock(fruit: fruit) - quantity
    }
    
    func checkStock(fruit: Fruit, quantity: Int) throws {
        if try takeStock(fruit: fruit) < quantity {
            throw FruitStoreError.outOfStock
        }
    }
    
    func takeStock(fruit: Fruit) throws -> Int {
        guard let stockOfFruit = fruitsStock[fruit] else {
            throw FruitStoreError.fruitNotFound
        }
        
        return stockOfFruit
    }
}
