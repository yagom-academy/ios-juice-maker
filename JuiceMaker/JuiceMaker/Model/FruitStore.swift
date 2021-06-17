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
    case stockBelowMinimum
}

// 과일 타입
class FruitStore {
    static let shared = FruitStore()
    private var fruitList: [Fruit: Int] = [:]

    init(initialStock: Int = 10) {
        for fruit in Fruit.allCases {
            fruitList[fruit] = initialStock
        }
    }

    func showStockLeft(fruit: Fruit) throws -> Int {
        guard let stockLeft = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        return stockLeft
    }

    /// Stepper의 value로 업데이트하기 위한 메서드
    func updateStock(of fruit: Fruit, by amount: Int) throws {
        guard let _ = fruitList[fruit] else {
            throw FruitStoreError.invalidFruit
        }
        guard amount >= 0 else {
            throw FruitStoreError.stockBelowMinimum
        }
        fruitList[fruit]? = amount
        let fruitStock = FruitStock(fruit: fruit, stock: amount)
        NotificationCenter.default.post(name: .changedFruitStock, object: fruitStock)
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
            throw FruitStoreError.stockBelowMinimum
        }
        fruitList[fruit]? -= amountToReduce
        guard let currentStock = fruitList[fruit] else {
            return
        }
        let fruitStock = FruitStock(fruit: fruit, stock: currentStock)
        NotificationCenter.default.post(name: .changedFruitStock, object: fruitStock)
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

struct FruitStock {
    let fruit: Fruit
    let stock: Int
}

extension Notification.Name {
    static let changedFruitStock = Notification.Name("changedFruitStock")
}
