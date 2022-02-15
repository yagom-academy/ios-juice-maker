//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    
    private let fruitStocks: [Fruit: Quantity]
    
    init() {
        let allFruits = Fruit.allCases
        fruitStocks = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = FruitStore.DEFAULT_FRUIT_QUANTITY
        })
    }
    
    func getStock(of fruit: Fruit) -> Quantity {
        return fruitStocks[fruit] ?? Quantity.ZERO
    }
    
    
    
}

extension FruitStore {
    
    private static let DEFAULT_FRUIT_QUANTITY: Quantity = Quantity(10)
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
}
