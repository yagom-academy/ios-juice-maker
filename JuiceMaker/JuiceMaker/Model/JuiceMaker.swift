//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()

    private func useFruits(_ fruit: Fruit, _ amount: Int) throws {
        guard let stock = fruitStore.checkStock(of: fruit) else {
            throw FruitJuiceError.notFoundFruitInformation
        }
        
        if stock < amount {
            throw FruitJuiceError.insufficientFruitStock
        }
        
        try fruitStore.consumeStock(of: fruit, by: amount)
    }
    
    private func makeJuice(_ juice: Juice) throws {
        switch juice {
        case .strawberry:
            try useFruits(.strawberry, 16)
        case .banana:
            try useFruits(.banana, 2)
        case .kiwi:
            try useFruits(.kiwi, 3)
        case .pineapple:
            try useFruits(.pineapple, 2)
        case .strawNana:
            try useFruits(.strawberry, 10)
            try useFruits(.banana, 1)
        case .mango:
            try useFruits(.mango, 3)
        case .mangKi:
            try useFruits(.mango, 2)
            try useFruits(.kiwi, 1)
        }
    }
}
