//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
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

    func showFruitQuantity(fruitsStock: [Fruit: Int], amount: Int) -> Bool {
        for (fruit, useQuantity) in fruitsStock {
            let requestFruit = useQuantity * amount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if requestFruit > storeFruit {
                return false
            }
        }
        
        return true
    }
}





