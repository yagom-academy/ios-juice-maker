//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var fruitStocks: [Fruit: Quantity]
    
    init(everyStock: Quantity = defaultFruitQuantity) {
        let allFruits = Fruit.allCases
        fruitStocks = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = everyStock
        })
    }
    
    /// 과일 재고 개수 얻기.
    ///
    /// - Returns: 남은 과일의 재고
    ///
    /// - Parameter of: 재고를 알고 싶은 과일
    func stock(of fruit: Fruit) -> Quantity {
        return fruitStocks[fruit] ?? Quantity.zero
    }
    
    /// 과일 재고 개수 늘리기.
    ///
    /// - Returns: Nothing
    ///
    /// - Parameter of: 재고를 늘리고 싶은 과일
    /// - Parameter _ : 늘리고 싶은 양
    mutating func increaseStock(of fruit: Fruit, _ quantity: Quantity) {
        guard let stock = fruitStocks[fruit] else {
            fruitStocks[fruit] = quantity
            return
        }
        fruitStocks[fruit] = stock + quantity
    }
    
    /// 과일 재고 개수 줄이기.
    ///
    /// - Returns: Nothing
    ///
    /// - Parameter of: 재고를 줄이고 싶은 과일
    /// - Parameter _: 줄이고 싶은 양
    ///
    /// - Throws: `FruitStoreError.outOfStockError` 재고가 충분치 않은데도 불구하고 줄이기의 요청이 들어올 경우
    mutating func decreaseStock(of fruit: Fruit, _ quantity: Quantity) throws {
        guard let stock = fruitStocks[fruit] else {
            throw FruitStoreError.outOfStock
        }
        do {
            let result = try stock - quantity
            fruitStocks[fruit] = result
        } catch Quantity.QuantityError.minusResult {
            throw FruitStoreError.outOfStock
        }
    }
}

extension FruitStore {
    private static let defaultFruitQuantity: Quantity = Quantity(10)
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    enum FruitStoreError: Error {
        case outOfStock
    }
}
