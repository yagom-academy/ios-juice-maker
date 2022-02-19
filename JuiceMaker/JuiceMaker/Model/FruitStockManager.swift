//
//  FruitCounter.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

struct FruitStockManager {
    private var stocks: [Fruit:Int] = [:]
    
    init(stocks: [Fruit:Int]) {
        self.stocks = stocks
    }
    
    mutating func change(amount count: Int, about: Fruit) {
        stocks[about] = count
    }
    
    func count(stock fruit: Fruit) -> Int {
        return stocks[fruit] ?? Int.zero
    }
}
