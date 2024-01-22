//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitResultType {
    case success
    case failure
}

class FruitStore {
    var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(changeFruit: String, changeQuantity: Int) {
        fruitStorage.updateValue(changeQuantity, forKey: changeFruit)
    }

    func showFruitQuantity(showFruits: [String: Int], showAmount: Int) -> FruitResultType {
        for (fruit, useQuantity) in showFruits {
            let requestFruit = useQuantity * showAmount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if requestFruit > storeFruit {
                return .failure
            }
        }
        
        return .success
    }
}





