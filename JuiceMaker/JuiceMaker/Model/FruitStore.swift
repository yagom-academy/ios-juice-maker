//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

class FruitStore {
    private let initialStock = 10
    private(set) lazy var fruitStock: [Fruits: Int] = [
        .strawberry: initialStock, .banana: initialStock,
        .pineapple: initialStock, .mango: initialStock,
        .kiwi: initialStock
    ]
    
    func addStock(fruit: Fruits, quantity: Int) {
        fruitStock[fruit]? += quantity
    }
    
    func useStock(fruit: Fruits, quantity: Int) {
        fruitStock[fruit]? -= quantity
    }
}
