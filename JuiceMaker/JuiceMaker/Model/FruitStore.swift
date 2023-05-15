//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var stock: [Fruit: Int] = [
        .strawBerry: 15,
        .banana: 11,
        .pineApple: 12,
        .kiwi: 13,
        .mango: 14
    ]
    
    func decreaseStock(with fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            if let stock = self.stock[fruit] {
                self.stock[fruit] = stock - quantity
                print("\(self.stock[fruit]!)남은수량 \(stock) 재고 \(quantity) 필요수량")
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

