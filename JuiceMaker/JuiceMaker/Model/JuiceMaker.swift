//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    static let shared = JuiceMaker()
    private var fruitStorage = FruitStock(initAmount: 102)
    
    private init() {}
    
    func make(order: Juices) throws {
        for (kind, amountForJuice) in order.recipe {
            do {
                try hasFruitStock(fruit: kind, amount: amountForJuice)
                 consume(fruit: kind, amount: amountForJuice)
            } catch {
                throw JuiceMakerError.lackStock
            }
        }
    }
    
    func addFruitStock(fruit kind: Fruits, amount addFruits: Int = 1) {
        fruitStorage.manageStorage(fruit: kind, amount: addFruits)
    }
    
    func currentFruit(fruit: Fruits) -> String {
        return String(fruitStorage.fruits[fruit]!)
    }
    
    func initStock() -> Int {
        return fruitStorage.initValue
    }
    
    private func consume(fruit kind: Fruits, amount: Int)  {
        fruitStorage.manageStorage(fruit: kind, amount: -amount)
    }
    
    private func hasFruitStock(fruit kind: Fruits, amount: Int) throws {
        guard let stock = fruitStorage.fruits[kind], amount > 0, stock - amount >= 0 else {
            throw JuiceMakerError.lackStock
        }
    }
}
