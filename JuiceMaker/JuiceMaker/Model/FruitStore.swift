//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(fruitName: String, quantity: Int) {
        fruitStorage.updateValue(quantity, forKey: fruitName)
        print(fruitStorage)
    }
    
    func showFruitAmount(fruitName: String) -> Int {
        return fruitStorage[fruitName, default: 10]
    }
    
    func deductFruit(fruitName: String, quantity: Int) {
        fruitStorage[fruitName, default: 10] -= quantity
        print(fruitStorage)
    }
}





