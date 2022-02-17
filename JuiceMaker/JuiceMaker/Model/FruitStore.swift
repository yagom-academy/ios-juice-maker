//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stocks: [Fruit:Int] = [:]
    
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
    
    func useFruit(fruits: [Fruit: Int]) -> Bool {
        var usedStocks = self.stocks
        
        for useStock in fruits {
            usedStocks[useStock.key] = (usedStocks[useStock.key] ?? 0) - useStock.value
        }
        
        let isCanMake = isCanMake(stocks: usedStocks)
        if isCanMake {
            self.stocks = usedStocks
        }
        return isCanMake
    }
    
    private func isCanMake(stocks: [Fruit: Int]) -> Bool {
        return stocks.map { $0.value }.filter({ $0 < 0 }).count == 0
    }
    
    func getFruitCount(fruit: Fruit) -> Int {
        return stocks[fruit] ?? 0
    }
}
