//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stock: [(fruit: Fruit, count: Int)]?
    
    init() {
        self.initFruitStore()
    }
    
    func initFruitStore(initCount: Int = 10) {
        stock = []
        Fruit.allCases.forEach { fruit in
            stock?.append((fruit: fruit, count: initCount))
        }
    }
}
