//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init() {
        self.initFruitStore()
    }
    
    func initFruitStore(initCount: Int = 10) {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = initCount
        }
    }
}
