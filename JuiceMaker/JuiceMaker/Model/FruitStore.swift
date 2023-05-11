//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private var stockList: [Fruit: Int] = [:]
    
    init(stockQuantity: Int = 10) {
        Fruit.allCases.forEach { stockList[$0] = stockQuantity }
    }
    
    mutating func decreaseStock(witch fruit: Fruit, by quantity: Int) {
        stockList[fruit]? -= quantity
    }

    func checkStock(witch fruit: Fruit, by quantity: Int) throws {
        guard let currentStock = stockList[fruit], currentStock >= quantity else {
            throw FruitStoreError.outOfStock(fruit: fruit)
        }
    }
}
