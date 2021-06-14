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
    case outOfRange
}

// 과일 타입
class FruitStore {
    private var fruitList: [Fruit: Int] = [:]

    init(initialStock: Int) {
        for fruit in Fruit.allCases {
            fruitList[fruit] = initialStock
        }
    }

    func showStockLeft(fruit: Fruit) throws -> Int {
        if let stockLeft = fruitList[fruit] {
            return stockLeft
        }
        throw FruitStoreError.invalidFruit
    }

    // Stepper의 value로 업데이트하기 위한 메서드
    func updateStock(of fruit: Fruit, by amount: Int) throws {
        guard let _ = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        guard amount >= 0 else {
            throw FruitStoreError.outOfRange
        }
        fruitList[fruit]? = amount
    }

    func addStock(of fruit: Fruit, by amountToAdd: Int) throws {
        guard let _ = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        fruitList[fruit]? += amountToAdd
    }

    func reduceStock(of fruit: Fruit, by amountToReduce: Int) throws {
        guard let stock = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        guard stock - amountToReduce >= 0 else {
            throw FruitStoreError.outOfRange
        }
        fruitList[fruit]? -= amountToReduce
    }

    func hasMoreThan(of fruit: Fruit, by requiredAmount: Int) throws {
        guard let stock = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        if stock < requiredAmount {
            throw FruitStoreError.outOfStock
        }
    }
}
