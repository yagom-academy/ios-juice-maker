//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum JuiceMenu {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

final class FruitStore {
    private var stocks: [Fruit: Int] = [:]

    init() {
        self.stocks = Fruit.initializeDefaultFruits()
    }
    
    func consume(fruit: Fruit, amount: Int) throws {
        if hasEnoughStock(of: fruit, amount: amount) == false {
            throw JuiceMakerError.notEnoughFruitAmount(fruit: fruit.rawValue)
        }
        
        guard let oldAmount = stocks[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        let newAmount = oldAmount - amount
        stocks.updateValue(newAmount, forKey: fruit)
    }
    
    private func hasEnoughStock(of fruit: Fruit, amount: Int) -> Bool {
        guard let remainingAmount = stocks[fruit] else {
            return false
        }
        
        guard remainingAmount >= amount else {
            return false
        }
        
        return true
    }
}
