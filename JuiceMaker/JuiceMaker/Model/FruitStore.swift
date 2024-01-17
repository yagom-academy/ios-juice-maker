//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(changeFruit: String, changeQuantity: Int) {
        fruitStorage.updateValue(changeQuantity, forKey: changeFruit)
    }

    func showFruitQuantity(showFruits: [String: Int], showAmount: Int) -> Int {
        var status = 0
        
        for (fruit, useQty) in showFruits {
            let reqFruit = useQty * showAmount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if (reqFruit <= storeFruit) {
                status = 1
            } else if (reqFruit > storeFruit) {
                status = 0
                break
            } else {
                status = -1
                break
            }
        }
        
        return status
    }
}





