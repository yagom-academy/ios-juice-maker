//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    private func change(_ fruit: Fruit, _ stock: Int) {
        self.stock[fruit, default: 0] += stock
    }
    
    func decreaseStock(with juice: Juice) {
        let recipe: [Fruit: Int] = juice.recipe
        for (fruit, quantity) in recipe {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
    
    func checkStock(with juice: Juice) throws {
        let recipe: [Fruit: Int] = juice.recipe
        
        for (fruit, quantity) in recipe {
            guard let stock = self.stock[fruit], quantity <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
    }
}

