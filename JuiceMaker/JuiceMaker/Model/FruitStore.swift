//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    
    private var fruitStocks: [Fruit: Quantity]
    
    init() {
        let allFruits = Fruit.allCases
        fruitStocks = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = FruitStore.DEFAULT_FRUIT_QUANTITY
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
    
}

extension FruitStore {
    
    private static let DEFAULT_FRUIT_QUANTITY: Quantity = Quantity(10)
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
}
