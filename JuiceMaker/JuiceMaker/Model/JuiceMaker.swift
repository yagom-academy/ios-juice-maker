//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private let fruitStore: FruitStockManaging
    
    init(store: FruitStockManaging) {
        self.fruitStore = store
    }
    
    func makeJuice(menu: JuiceMenu) throws {
        for (fruit, quantity) in menu.recipe {
            try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: -)
        }
    }
    
    func currentFruitStock(of fruit: Fruit) throws -> Int {
        return try fruitStore.currentFruitStock(of: fruit)
    }
}

