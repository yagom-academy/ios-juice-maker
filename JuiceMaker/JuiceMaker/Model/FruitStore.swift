//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    static let shared: FruitStore = FruitStore()
    private var stockList: [Fruit: Int] = [:]
    
    private init(stockQuantity: Int = 10) {
        Fruit.allCases.forEach { stockList[$0] = stockQuantity }
    }
    
    func setStockList(with currentStockList: [Fruit: Int]) {
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
    
    func getRemainStock() -> [String] {
        var fruitStockList: [String] = []
        
        for fruit in Fruit.allCases {
            let currentStock: Int = stockList[fruit] ?? 0
            fruitStockList.append(String(currentStock))
        }
        
        return fruitStockList
    }
}
