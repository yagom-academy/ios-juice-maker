//
//  JuiceMaker - FruitStore.swift
//  Created by 써니쿠키, SummerCat
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let sharedFruitStore = FruitStore()
    
    private init() {}
    
    private var fruitStock: Dictionary<Fruit, Int> = [
        .strawberry : 10,
        .banana : 10,
        .pineapple : 10,
        .kiwi : 10,
        .mango : 10,
    ]
    
    func changeStockOf(fruit: Fruit, by quantity: Int) {
        guard let currentStock = fruitStock[fruit] else {
            return
        }
        
        fruitStock[fruit] = currentStock + quantity
    }
    
    func checkStockOf(_ ingredient: Fruit, total: Int) throws {
        guard let currentStock = fruitStock[ingredient] else {
            return
        }
        
        guard currentStock >= total else {
            throw JuiceMakerError.stockShortage
        }
    }
    
    func fetchStockOf(_ ingredient: Fruit) -> Int {
        return fruitStock[ingredient] ?? 0
    }
}
