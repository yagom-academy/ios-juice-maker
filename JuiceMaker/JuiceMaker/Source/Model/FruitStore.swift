//
//  JuiceMaker - FruitStore.swift
//  Created by HAMZZI, Danny. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var fruitStorage: [Fruit: Int]

    init(initialStock: [Fruit: Int]) {
        fruitStorage = initialStock
    }
    
    func changeFruitQuantity(fruitName: Fruit, quantity: Int) {
        fruitStorage[fruitName] = quantity
    }

    func checkFruitQuantity(fruitsStock: [Fruit: Int], amount: Int) throws {
        for (fruit, useQuantity) in fruitsStock {
            let requestFruit = useQuantity * amount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if requestFruit > storeFruit {
                throw FruitResultError.outOfStock
            }
        }
    }
}





