//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var stockList: [Fruit: Int] = [:]
    
    init(stockQuantity: Int = 10) {
        Fruit.allCases.forEach { stockList[$0] = stockQuantity }
    }
    
    func updateStockList(with currentStockList: [Fruit: Int]) {
        stockList = currentStockList
    }
    
    func decreaseStock(witch fruit: Fruit, by quantity: Int) {
        guard let currentStock = stockList[fruit] else { return }
        
        stockList[fruit] = currentStock - quantity
    }

    func checkStock(witch fruit: Fruit, by quantity: Int) throws {
        guard let currentStock = stockList[fruit], currentStock >= quantity else {
            throw FruitStoreError.outOfStock
        }
    }
    
    func fetchRemainStock() -> [String] {
        var fruitStockList: [String] = []
        
        for fruit in Fruit.allCases {
            let currentStock: Int = stockList[fruit] ?? 0
            fruitStockList.append(String(currentStock))
        }
        
        return fruitStockList
    }
}
