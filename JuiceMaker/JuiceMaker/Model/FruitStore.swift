//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum FruitStoreError: Error {
    case outOfStock
    case invalidFruit
}

// 과일 타입
class FruitStore {
    private var fruitList: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            fruitList[fruit] = 10
        }
    }
    
    func showStockLeft(fruit: Fruit) throws -> Int {
        if let stockLeft = fruitList[fruit] {
            return stockLeft
        }
        throw FruitStoreError.invalidFruit
    }

    func updateStock(of fruit: Fruit, by number: Int) throws {
        guard let _ = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        fruitList[fruit]? = number
    }

    func consumeStock(of fruit: Fruit, by number: Int) throws {
        guard let _ = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        fruitList[fruit]? -= number
    }

    func hasMoreThan(of fruit: Fruit, requiredAmount: Int) throws -> Bool {
        guard let stock = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        if stock < requiredAmount {
            return false
        }
        return true
    }
}
