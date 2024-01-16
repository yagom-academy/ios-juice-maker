//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStorage = ["딸기": 16, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func changeFruitQuantity(fruitName: String, quanitity: Int) {
//        fruitStorage.updateValue(quanitity, forKey: fruitName)
        fruitStorage[fruitName] = quanitity
        print(fruitStorage)
    }
    
    func showFruitAmount(fruitName: String) -> Int {
        return fruitStorage[fruitName, default: 10]
    }
}





