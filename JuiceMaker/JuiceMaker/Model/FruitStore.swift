//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stocks: [Fruit:Int] = [:]
    
    init(fruitType: [Fruit: Int] = [:]) {
        for fruit in Fruit.allCases {
            stocks[fruit] = 10
        }
        
        for fruit in fruitType {
            stocks[fruit.key] = fruit.value
        }
    }
    
    func addFruit(numberOf: Int, fruit: Fruit) {
        stocks[fruit] = numberOf + (stocks[fruit] ?? 0)
    }
    
    func useFruit(fruits: [Fruit: Int]) throws {
        var usedStocks = self.stocks
        
        for useStock in fruits {
            usedStocks[useStock.key] = (usedStocks[useStock.key] ?? 0) - useStock.value
        }
        
        guard isCanMake(stocks: usedStocks) else {
            throw JuiceMakerError.outOfStock
        }
        self.stocks = usedStocks
    }
    
    private func isCanMake(stocks: [Fruit: Int]) -> Bool {
        return stocks.map { $0.value }.filter({ $0 < 0 }).count == 0
    }
}
