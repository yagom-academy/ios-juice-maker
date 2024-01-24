//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(fruitName: String, quantity: Int) {
        fruitStorage.updateValue(quantity, forKey: fruitName)
    }

    func showFruitQuantity(fruitsStock: [String: Int], amount: Int) -> FruitResultType {
        for (fruit, useQuantity) in fruitsStock {
            let requestFruit = useQuantity * amount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if requestFruit > storeFruit {
                return FruitResultType.outOfStock
            }
        }
        
        return .success
    }
}





