//
//  JuiceMaker - JuiceMaker.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()

    func makeJuice(by recipe: [Fruit: Int]) throws {
        for (fruit, requiredQuantity) in recipe {
            guard let fruitStock = fruitStore.inventory[fruit] else {
                throw OrderError.unknownError
            }
            guard fruitStock >= requiredQuantity else {
                throw OrderError.outOfStock
            }
            fruitStore.inventory[fruit] = fruitStock - requiredQuantity
        }
    }
}
