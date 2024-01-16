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
    
    func fillStock(fruit: Fruit, amount: Int) throws {
        let stockOfFruit = try takeStock(fruit: fruit)
        
        fruitsStock[fruit] = stockOfFruit + amount
    }
    
    func adjust(fruit: Fruit, amount: Int) throws {
        guard let stockOfFruit = fruitsStock[fruit], stockOfFruit >= amount else {
            throw FruitStoreError.outOfStock
        }
        
        fruitsStock[fruit]? -= amount
    }
    
    func takeStock(fruit: Fruit) throws -> Int {
        guard let stockOfFruit = fruitsStock[fruit] else {
            throw FruitStoreError.fruitNotFound
        }
        
        return stockOfFruit
    }
}
