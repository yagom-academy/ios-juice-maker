//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawNana, mango, mangKi
}

enum JuiceError: Error {
    case insufficientFruitStock
    case notFoundFruitInformation
}

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()

    private func useFruits(_ fruit: Fruit, _ amount: Int) throws {
        guard let stock = fruitStore.checkStock(of: fruit) else {
            throw JuiceError.notFoundFruitInformation
        }
        
        if stock < amount {
            throw JuiceError.insufficientFruitStock
        }
        
        try fruitStore.consumeStock(of: fruit, by: amount)
    }
}
