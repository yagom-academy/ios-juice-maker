//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {    
    private var inventory: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func checkStock(of fruit: Fruit) -> Int? {
        if let stock = inventory[fruit] {
            return stock
        } else {
            return nil
        }
    }
    
    func consumeStock(of fruit: Fruit, by amount: Int) throws {
        if let currentStock = inventory[fruit] {
            inventory[fruit] = currentStock - amount
        } else {
            throw FruitJuiceError.notFoundFruitInformation
        }
    }
    
    func orderFruits(of fruit: Fruit, by amount: Int) throws {
        if let currentStock = inventory[fruit] {
            inventory[fruit] = currentStock + amount
        } else {
            throw FruitJuiceError.notFoundFruitInformation
        }
    }
}
