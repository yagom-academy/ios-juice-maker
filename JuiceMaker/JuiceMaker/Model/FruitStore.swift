//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

class FruitStore {
    static let initialStock = 10
    var fruitStock: [Fruits: Int] = [
        .strawberry: initialStock, .banana: initialStock,
        .pineapple: initialStock, .mango: initialStock,
        .kiwi: initialStock
    ]
    
    func changeStock(item: Fruits, amount: Int) {
        fruitStock[item]? += amount
    }
}
