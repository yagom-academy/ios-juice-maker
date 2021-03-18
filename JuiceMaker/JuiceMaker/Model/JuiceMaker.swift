//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class JuiceMaker {
    static let shared = JuiceMaker()
    private var fruitStorage = FruitStock(initAmount: 20)
 
    private init() {}
    
    func make(order: Juices) -> Bool {
        for (kind, amountForJuice) in order.recipe {
            if hasFruitStock(fruit: kind, amount: amountForJuice) {
                consume(fruit: kind, amount: amountForJuice)
            } else {
                return false
            }
        }
        return true
    }
    
    func currentFruit(fruit: Fruits) -> Int {
        if let amount = fruitStorage.fruits[fruit] {
            return amount
        } else {
            NSLog(JuiceMakerError.invalidStock.localizedDescription)
            fatalError()
        }
    }
    
    private func consume(fruit kind: Fruits, amount: Int) {
        fruitStorage.manageStorage(fruit: kind, amount: -amount)
    }
    
    private func hasFruitStock(fruit kind: Fruits, amount: Int) -> Bool {
        guard let stock = fruitStorage.fruits[kind], amount > 0, stock - amount >= 0 else {
            return false
        }
        return true
    }
}
