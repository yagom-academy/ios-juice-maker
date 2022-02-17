//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Fruits = [Fruit: Int]

// 과일 저장소 타입
class FruitStore {
    private var stocks: [Fruit:Int] = [:]
    
    init(fruitType: Fruits = [:]) {
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
    
    func useFruit(fruits: Fruits) throws {
        var usedStocks = self.stocks
        
        for useStock in fruits {
            usedStocks[useStock.key] = (usedStocks[useStock.key] ?? 0) - useStock.value
        }
        
        let isCanMake = isCanMake(stocks: usedStocks)
        if isCanMake {
            self.stocks = usedStocks
        }
        self.stocks = usedStocks
    }
    
    private func isCanMake(stocks: Fruits) -> Bool {
        return stocks.map { $0.value }.filter({ $0 < 0 }).count == 0
    }
    
    func getFruitCount(fruit: Fruit) -> Int {
        return stocks[fruit] ?? 0
    }
    
    func setFruitCountPlusOrMinusOne(numberOf: Int, fruit: Fruit) {
        stocks[fruit] = numberOf
    }
}
