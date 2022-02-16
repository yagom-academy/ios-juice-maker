//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stocks: [Fruit: Int]
    
    init(initalValue: Int = 10) {
        var stocks: [Fruit: Int] = [:]
        for fruit in Fruit.allCases {
            stocks[fruit] = initalValue
        }
        self.stocks = stocks
    }
    
    func add(numberOf: Int, fruit: Fruit) {
        stocks[fruit] = numberOf + (stocks[fruit] ?? 0)
    }
    
    func useFruit(fruits: [Fruit: Int]) {
        var stocks = self.stocks
        
        for useStock in fruits {
            stocks[useStock.key] = (stocks[useStock.key] ?? 0) - useStock.value
        }
        
        let isCanMake = stocks.map { $0.value }.filter({ $0 < 0 }).count == 0
        
        if isCanMake {
            self.stocks = stocks
        }
    }
}
