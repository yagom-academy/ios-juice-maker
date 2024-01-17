//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStorage = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    // 과일의 개수를 n개로 변경 가능
    func changeFruitQuantity(fruitName: String, quantity: Int) {
        fruitStorage.updateValue(quantity, forKey: fruitName)
        print(fruitStorage)
    }
    
    func showFruitAmount(fruitName: String) -> Int {
        return fruitStorage[fruitName, default: 10]
    }
    
    // 과일의 개수를 차감
    func deductFruit(fruitName: String, quantity: Int) {
        fruitStorage[fruitName, default: 10] -= quantity
        print(fruitStorage)
    }
}





