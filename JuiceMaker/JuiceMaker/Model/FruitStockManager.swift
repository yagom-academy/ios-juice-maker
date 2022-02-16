//
//  FruitCounter.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

class FruitStockManager {
    private(set) var stocks: [Fruit:Int] = [:]
    
    init(stocks: [Fruit:Int]) {
        self.stocks = stocks
    }
    
    func change(amount count: Int, about: Fruit) {
        stocks[about] = count
    }
    
    func count(stock fruit: Fruit) -> Int {
        return stocks[fruit] ?? Int.zero
    }
}
