//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    
    private var fruitStocks: [Fruit: Quantity]
    
    init(everyStock: Quantity = DEFAULT_FRUIT_QUANTITY) {
        let allFruits = Fruit.allCases
        fruitStocks = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = everyStock
        })
    }
    
    func getStock(of fruit: Fruit) -> Quantity {
        return fruitStocks[fruit] ?? Quantity.ZERO
    }
    
    mutating func increaseStock(of fruit: Fruit, _ quantity: Quantity) {
        guard let stock = fruitStocks[fruit] else {
            fruitStocks[fruit] = quantity
            return
        }
        fruitStocks[fruit] = stock + quantity
    }
    
    mutating func decreaseStock(of fruit: Fruit, _ quantity: Quantity) throws {
        guard let stock = fruitStocks[fruit] else {
            throw FruitStoreError.outOfStockError
        }
        do {
            let result = try stock - quantity
            fruitStocks[fruit] = result
        } catch Quantity.QuantityError.minusResultError {
            throw FruitStoreError.outOfStockError
        }
    }
    
}

extension FruitStore {
    
    private static let DEFAULT_FRUIT_QUANTITY: Quantity = Quantity(10)
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    enum FruitStoreError: Error {
        case outOfStockError
    }
    
}
