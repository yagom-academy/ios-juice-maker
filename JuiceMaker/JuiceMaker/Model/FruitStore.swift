//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Darwin
class FruitStore {
    private let initialStock: Int
    private var stock = [Fruit: Int]()

    init(initialStock: Int) {
        self.initialStock = initialStock
        
        for fruit in Fruit.allCases {
            stock[fruit] = initialStock
        }
    }
    
    convenience init() {
        self.init(initialStock: 10)
        
        for fruit in Fruit.allCases {
            stock[fruit] = initialStock
        }
    }
    
    func takeOutStock(fruit: Fruit) throws -> Int {
        guard let currentStock = stock[fruit] else {
            throw StockError.noFruit
        }
        return currentStock
    }
    
    func decreaseStock(from fruit: Fruit, by input: Int) throws {
        guard let currentStock = stock[fruit], currentStock > input else {
            throw StockError.notEnoughStock
        }
        
        stock[fruit] = currentStock - input
    }
    
    func increasStock(from fruit: Fruit, by input: Int) throws {
        guard let currentStock = stock[fruit] else {
            throw StockError.noFruit
        }
        
        stock[fruit] = currentStock + input
    }
}



