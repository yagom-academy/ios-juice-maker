//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

class FruitStore {
    
    var fruitsStock = [Fruits: Int]()
    
    func append() {
        for fruit in Fruits.allCases {
            fruitsStock[fruit] = 10
        }
    }
    //[:10, "망고":10, "바나나":10, "키위":10, "파인애플":10]
    
    func subtractInventory(fruit: Fruits, number: Int) throws {
        guard let selectedStock = self.fruitsStock[fruit],
              selectedStock - number >= 0 else {
            throw StockError.outOfStock
        }
        
        fruitsStock[fruit] = selectedStock - number
    }
    
    func addInventory(fruit: Fruits, number: Int) {
        if let selectedStock = self.fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock + number
        }
    }
    
    func checkStock(fruit: Fruits) {
        if let stock = fruitsStock[fruit] {
            let resultMessage = "\(fruit)의 재고는 \(stock)개입니다."
            print(resultMessage)
        }
    }
}

