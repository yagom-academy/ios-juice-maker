//
//  JuiceMaker - FruitStore.swift
//  Created by mireu,charles
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private(set) var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
    
    mutating func addFruitStock(name: Fruit, count: Int) {
        if let currentStock = fruitStock[name] {
            fruitStock.updateValue(currentStock + count, forKey: name)
        }
    }
    
    func checkFruitStock(name: Fruit, count: Int) throws {
        guard let currentStock = fruitStock[name], currentStock >= count else {
            throw FruitStoreError.outOfStock
        }
    }
    
    mutating func subtractFruitStock(name: Fruit, count: Int) {
        guard let currentStock = fruitStock[name] else { return }
        
        fruitStock.updateValue(currentStock - count, forKey: name)
    }
}
