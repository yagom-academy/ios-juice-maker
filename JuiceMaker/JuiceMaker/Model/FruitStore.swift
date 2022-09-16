//
//  JuiceMaker - FruitStore.swift
//  Created by Mene, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore.init(initialFruitAmount: 10)
    
    var inventory: [Fruit: Int] = [:]
    private init(initialFruitAmount: Int) {
        Fruit.allCases.forEach { inventory[$0] = initialFruitAmount }
    }
    
    func addToInventory(of fruit: Fruit, by amount: Int) {
        guard let fruitStock = inventory[fruit] else { return }
        inventory[fruit] = fruitStock + amount
    }
    
    func removeToInventory(of fruit: Fruit, by amount: Int) {
        guard let fruitStock = inventory[fruit] else { return }
        
        if fruitStock < amount {
            return
        }
        
        inventory[fruit] = fruitStock - amount
    }
}
