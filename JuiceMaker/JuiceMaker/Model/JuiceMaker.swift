//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    
    let fruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        do {
            try fruitStore.consumeStock(with: juice)
        } catch {
            throw StockError.notEnoughStock
        }
    }
}
