//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

class FruitStore {
    private let initialStock: Int
    private(set) lazy var fruitStock: [Fruits: Int] = [
        .strawberry: initialStock, .banana: initialStock,
        .pineapple: initialStock, .mango: initialStock,
        .kiwi: initialStock
    ]
    
    init(initialStock: Int) {
        self.initialStock = initialStock
    }
    
    func addStock(fruit: Fruits, quantity: Int) {
        guard let oldValue = fruitStock[fruit] else {
            fruitStock[fruit] = quantity
            return
        }
        fruitStock[fruit] = oldValue + quantity
    }
    
    func useStock(fruit: Fruits, quantity: Int) {
        guard let oldValue = fruitStock[fruit] else { return }
        fruitStock[fruit] = oldValue - quantity
    }
}
