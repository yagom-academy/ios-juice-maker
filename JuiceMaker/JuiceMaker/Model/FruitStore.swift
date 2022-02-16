//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var fruits: [Fruit: Int]
    
    mutating func increase(in fruit: Fruit) {
        guard let value = fruits[fruit] else {
            return
        }
        
        self.fruits[fruit] = value + 1
    }
    
    mutating func decrease(in fruit: Fruit) {
        guard let value = fruits[fruit], value > 0 else {
            return
        }
        
        self.fruits[fruit] = value - 1
    }
}
