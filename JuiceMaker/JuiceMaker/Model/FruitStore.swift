//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class FruitStore {
    private(set) var stock = [Fruit: Int]()

    init(stockAmount: Int) {
        fillStock(by: stockAmount)
    }
    
    convenience init() {
        self.init(stockAmount: 10)
        
        fillStock(by: 10)
    }
    
    private func fillStock(by amount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = amount
        }
    }
    
    func consumeStock(with juice: Juice) throws {
        let recipes = juice.recipes
        
        for (fruit, amount) in recipes {
            guard let currentStock = stock[fruit], currentStock >= amount else {
                throw StockError.notEnoughStock
            }
            
            try decreaseStock(from: fruit, by: amount)
        }
    }
    
    func modifyStock(from fruit: Fruit, by input: UIStepper) {
        stock[fruit] = Int(input.value)
    }
    
    private func decreaseStock(from fruit: Fruit, by input: Int) throws {
        guard let currentStock = stock[fruit], currentStock >= input else {
            throw StockError.notEnoughStock
        }
        
        stock[fruit] = currentStock - input
    }
}
