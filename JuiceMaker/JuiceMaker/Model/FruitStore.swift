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
        inventory[fruit]
    }
    
    func updateStock(of fruit: Fruit, by amount: Int, operation: StockUpdate) -> Result<Int, FruitJuiceError> {
        guard let currentStock = inventory[fruit] else {
            return .failure(.notFoundFruitInformation)
        }
        
        switch operation {
        case .consume:
            if currentStock < amount {
                return .failure(.insufficientFruitStock)
            }
            inventory[fruit] = currentStock - amount
        case .order:
            inventory[fruit] = currentStock + amount
        }
        
        guard let updateStock = inventory[fruit] else {
            return .failure(.notFoundFruitInformation)
        }
        
        return .success(updateStock)
    }
}
