//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

//import Darwin
class FruitStore {
    private var stock = [Fruit: Int]()

    init(stockAmount: Int) {
        fillStock(by: stockAmount)
    }
    
    convenience init() {
        self.init(stockAmount: 10)
        
        fillStock(by: 10)
    }
    
    func fillStock(by amount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = amount
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



