//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
    
    func addFruitStock(fruitName: Fruit, count: Int) {
        if let currentStock = fruitStock[fruitName] {
            fruitStock.updateValue(currentStock + count, forKey: fruitName)
        }
    }
    
    func subtractFruitStock(fruitName: Fruit, count: Int) {
        guard let currentStock = fruitStock[fruitName], currentStock - count >= 0 else {
            return
        }
        fruitStock.updateValue(currentStock - count, forKey: fruitName)
    }
}
