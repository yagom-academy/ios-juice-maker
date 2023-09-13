//
//  JuiceMaker - FruitStore.swift
//  Created by mireu,charles
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
    
    private func addFruitStock(name: Fruit, count: Int) {
        if let currentStock = fruitStock[name] {
            fruitStock.updateValue(currentStock + count, forKey: name)
        }
    }
    
    func subtractFruitStock(name: Fruit, count: Int) throws {
        guard let currentStock = fruitStock[name], currentStock - count >= 0 else {
            throw FruitStoreError.outOfStock
        }
        fruitStock.updateValue(currentStock - count, forKey: name)
    }
}
