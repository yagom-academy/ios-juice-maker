//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitStocks: [Fruit: Int] 
    
    init(fruitStocks: [Fruit: Int]) {
        self.fruitStocks = fruitStocks
    }
    
    func isEnoughFruits(_ fruit: Fruit, count: Int) -> Bool {
        guard let stock = fruitStocks[fruit] else { return false }
        
        return stock >= count
    }
    
    func changeFruitCount(_ fruit: Fruit, _ amount: Int) {
        guard let stock = fruitStocks[fruit] else { return }
        
        fruitStocks[fruit] = stock + amount
    }
    
    func provideFruitStock(_ fruit: Fruit) -> Int? {
        let stock = fruitStocks[fruit]
        
        return stock
    }
}
