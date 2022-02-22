//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitList: Dictionary = [FruitType.strawberry: 10,
                                 FruitType.banana: 10,
                                 FruitType.pineapple: 10,
                                 FruitType.kiwi: 10,
                                 FruitType.mango: 10]
    
    func updateQuantity(_ fruit: FruitType, _ quantity: Int) {
        guard var updatedFruitList = fruitList[fruit] else { return }
        updatedFruitList += quantity
    }
}
