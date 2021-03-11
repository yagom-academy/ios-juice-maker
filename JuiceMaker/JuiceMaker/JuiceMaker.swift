//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    
    var fruitStorage = FruitStock.shared
    
    func make(order: Juices) {
        for (kind, amountForJuice) in order.recipe {
            do {
                try hasFruitStock(fruit: kind, amount: amountForJuice)
                consumeFruit(fruit: kind, amount: amountForJuice)
            } catch {
                // TODO: -  lackStock 알럿 처리
            }
        }
    }
    
    func consumeFruit(fruit kind: Fruits, amount: Int) {
        do {
            try fruitStorage.manageStorage(fruit: kind, amount: -amount)
        } catch {
            // TODO: - inValidStock 알럿 처리
        }
    }
    
    func addFruitStock(fruit kind: Fruits, amount addFruits: Int = 1) {
        do {
            try fruitStorage.manageStorage(fruit: kind, amount: addFruits)
        } catch {
            // TODO: - inValidStock 알럿 처리
        }
    }
    
    func hasFruitStock(fruit kind: Fruits, amount: Int) throws {
        guard let stock = fruitStorage.fruits[kind], amount > 0, stock - amount >= 0 else {
            throw StockError.lackStock
        }
    }
    
    func currentFruitStock() -> Storage {
        return fruitStorage.fruits
    }
}
