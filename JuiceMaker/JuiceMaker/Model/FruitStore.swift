//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
}
