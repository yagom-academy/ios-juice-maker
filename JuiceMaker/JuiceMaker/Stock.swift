//
//  Stock.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/08.
//

import Foundation

struct Stock {
    private var stock = [Fruit: Int]()
    
    init() {
        for fruit in Fruit.allCases {
            self.stock[fruit] = 1
        }
    }
    
    func count(for fruit: Fruit) -> Int {
        guard let fruitNumberInStock = stock[fruit] else { fatalError() }
        return fruitNumberInStock
    }
    
    mutating func subtract(for fruit: Fruit, amount: Int = 1) {
        guard var fruitNumberInStock = stock[fruit] else { fatalError() }
        fruitNumberInStock -= amount
    }
    
    mutating func add(for fruit: Fruit) {
        guard var FruitNumberInStock = stock[fruit] else { fatalError() }
        FruitNumberInStock += 1
    }
}
