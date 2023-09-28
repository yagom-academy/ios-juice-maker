//
//  JuiceMaker - FruitStore.swift
//  Created by mireu,charles
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private(set) var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
    
    func changeFruitStock(to stock: [Fruit: Int]) {
        fruitStock = stock
    }
    
    private func checkFruitStock(juice: Juice) throws {
        for (name, count) in juice.recipe {
            guard let currentStock = fruitStock[name], currentStock >= count else {
                throw FruitStoreError.outOfStock
            }
        }
    }
    
    func subtractFruitStock(juice: Juice) throws {
        try checkFruitStock(juice: juice)
        
        for (name, count) in juice.recipe {
            guard let currentStock = fruitStock[name] else { return }
            
            fruitStock.updateValue(currentStock - count, forKey: name)
        }
    }
}
