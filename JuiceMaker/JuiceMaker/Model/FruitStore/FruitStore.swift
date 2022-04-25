//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

}

//MARK: 과일 저장소 타입
class FruitStore: Fruitable {
    private var fruits: [Fruit:Int] = [:]
    
    init(initialValue: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits.updateValue(initialValue, forKey: fruit)
        }
    }
}

