//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class JuiceMaker {
    private(set) var stock: Stock
    static let shared = JuiceMaker(stock: Stock(basicValue: 10))
    
    private init(stock: Stock) {
        self.stock = stock
    }
    
    func make(_ juice: Juice) {
        stock.decrease(by: juice.recipe)
    }
    
    func manageStock(_ fruit: Fruit, by quantity: Int) {
        stock.change(fruit, by: quantity)
    }
}

struct Stock {
    private(set) var fruits: [Fruit: Int]
    
    init(basicValue: Int) {
        fruits = [:]
        for fruit in Fruit.allCases {
            fruits[fruit] = basicValue
        }
    }
    
    func hasFruits(for juice: Juice) throws -> Bool {
        var hasFruit: Bool = true
        
        for fruit in juice.recipe {
            guard let fruitStock: Int = self.fruits[fruit.key] else { throw StockError.invalidSelection }
            hasFruit = hasFruit && fruitStock >= fruit.value
        }
        
        return hasFruit
    }
    
    mutating func decrease(by fruits: [Fruit: Int]) {
        for fruit in fruits {
            self.fruits[fruit.key]? -= fruit.value
        }
    }
    
    mutating func change(_ fruit: Fruit, by quantity: Int) {
        fruits[fruit]? += quantity
    }
}
