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
    
    private func checkJuiceAvailability(of menu: JuiceMenu) throws -> Bool {
        var availability: [Bool] = []
        for (fruit, quantity) in menu.recipe {
            availability.append(try fruitStore.checkFruitStock(of: fruit, by: quantity))
        }
        return availability.contains(false) ? false : true
    }
}

extension JuiceMaker: JuiceMaking {
    func makeJuice(menu: JuiceMenu) throws {
        guard try checkJuiceAvailability(of: menu) else {
            throw FruitStoreError.stockShortage
        }
        for (fruit, quantity) in menu.recipe {
            try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: -)
        }
    }

    func currentFruitStock(of fruit: Fruit) throws -> Int {
        return try fruitStore.currentFruitStock(of: fruit)
    }
    func changeFruitStock(of fruit: Fruit, by quantity: Int, calculate: (Int, Int) -> Int) throws {
        try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: calculate)
    }
}
