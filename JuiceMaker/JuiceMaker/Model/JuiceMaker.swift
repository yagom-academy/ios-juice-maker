//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    
    static let shared = JuiceMaker()
    var fruitStorage = FruitStock(initAmount: 10)
    
    private init() {}
    
    func make(order: Juices) throws {
        for (kind, amountForJuice) in order.recipe {
            do {
                try hasFruitStock(fruit: kind, amount: amountForJuice)
                try consume(fruit: kind, amount: amountForJuice)
            } catch {
                throw StockError.lackStock
            }
        }
    }
    
    func currentFruitStock() -> Storage {
        return fruitStorage.fruits
    }
    
    func addFruitStock(fruit kind: Fruits, amount addFruits: Int = 1) throws {
        do {
            try fruitStorage.manageStorage(fruit: kind, amount: addFruits)
        } catch {
            throw StockError.inValidStock
        }
    }
    
    private func consume(fruit kind: Fruits, amount: Int) throws {
        do {
            try fruitStorage.manageStorage(fruit: kind, amount: -amount)
        } catch {
            throw StockError.inValidStock
        }
    }
    
    private func hasFruitStock(fruit kind: Fruits, amount: Int) throws {
        guard let stock = fruitStorage.fruits[kind], amount > 0, stock - amount >= 0 else {
            throw StockError.lackStock
        }
    }
}
