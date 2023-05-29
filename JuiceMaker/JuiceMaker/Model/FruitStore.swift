//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

final class FruitStore {
    private(set) var fruitStock: [Fruits: Int]
    
    init(initialStock: Int = 10) {
        self.fruitStock = [.strawberry: initialStock,
                           .banana: initialStock,
                           .pineapple: initialStock,
                           .kiwi: initialStock,
                           .mango: initialStock]
    }
    
    func bringQuantity(of fruit: Fruits) -> Int {
        guard let quantity = fruitStock[fruit] else { return 0 }
        return quantity
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
