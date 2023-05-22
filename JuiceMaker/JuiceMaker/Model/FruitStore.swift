//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    static let shared = FruitStore()
    
    private var stock: [Fruit: Int] = [
        .strawBerry: 25,
        .banana: 11,
        .pineApple: 12,
        .kiwi: 13,
        .mango: 14
    ]
    
    var currentFruitStock: [Fruit: Int] {
        return self.stock
    }
    
    private init() {}
    
    func changeStock(with fruits: Fruit, _ quantity: Int) {
        if let stock = self.stock[fruits] {
            self.stock[fruits] = stock + quantity
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

