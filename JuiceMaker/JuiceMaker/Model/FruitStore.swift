//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

class FruitStore {
    
    var fruitsStock = [Fruits: Int]()
    
    func fillFruitsStock() {
        for fruit in Fruits.allCases {
            fruitsStock[fruit] = 10
        }
    }
    
    func subtractStock(of fruit: Fruits, count number: Int) throws {
        guard let selectedStock = self.fruitsStock[fruit],
              selectedStock - number >= 0 else {
            throw StockError.outOfStock
        }
        
        fruitsStock[fruit] = selectedStock - number
    }
    
    func addStock(of fruit: Fruits, count number: Int) {
        if let selectedStock = self.fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock + number
        }
    }
    
    func checkStock(of fruit: Fruits) {
        if let stock = fruitsStock[fruit] {
            let resultMessage = "\(fruit)의 재고는 \(stock)개입니다."
            print(resultMessage)
        }
    }
    
    init() {
        self.fillFruitsStock()
    }
}

