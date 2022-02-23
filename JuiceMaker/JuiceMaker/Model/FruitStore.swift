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
        try hasEnoughStock(of: fruit, amount: amount)

        let oldAmount = try hasStock(of: fruit)
        let newAmount = oldAmount - amount
        stocks.updateValue(newAmount, forKey: fruit)
    }
    
    private func hasEnoughStock(of fruit: Fruit, amount: Int) throws {
        let remainingAmount = try hasStock(of: fruit)
        
        guard remainingAmount >= amount else {
            throw JuiceMakerError.notEnoughFruitAmount(fruit: fruit.rawValue)
        }
    }
    
    private func hasStock(of fruit: Fruit) throws -> Int {
        guard let remainingAmount = stocks[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        return remainingAmount
    }
}
