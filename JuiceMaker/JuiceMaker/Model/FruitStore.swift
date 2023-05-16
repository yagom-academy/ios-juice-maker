//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    static var shard = FruitStore()
        private init() {}
    private var stock: [Fruit: Int] = [
        .strawBerry: 25,
        .banana: 11,
        .pineApple: 12,
        .kiwi: 13,
        .mango: 14
    ]
    
    func receiveFruitStock() -> [Fruit: Int] {
        return self.stock
    }
    
    func changeStock(with fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
            }
        }
    }
    
    func checkStock(with fruits: [Fruit: Int]) throws {
        for (fruit, quantity) in fruits {
            guard let stock = self.stock[fruit], quantity <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
    }
}

