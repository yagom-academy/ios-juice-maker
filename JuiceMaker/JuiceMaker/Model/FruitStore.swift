//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    
    private let stock: [Fruit: Quantity]
    
    init() {
        let allFruits = Fruit.allCases
        stock = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = FruitStore.DEFAULT_FRUIT_QUANTITY
        })
    }
    
    func getStock(of fruit: Fruit) -> Quantity {
        return stock[fruit] ?? Quantity.ZERO
    }
    
}

extension FruitStore {
    
    private static let DEFAULT_FRUIT_QUANTITY: Quantity = Quantity(10)
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
}
