//
//  JuiceMaker - FruitStore.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruits = [Fruits: Int]()
    
    init() {
        let defaultValue = 10
        self.fruits.keys.forEach{ self.fruits[$0] = defaultValue }
    }
    
    func checkStock(juice: Juice) throws {
        for (recipieKey, recipieValue) in juice.recipie {
            for (listKey, listValue) in fruits {
                if recipieKey == listKey  {
                    guard recipieValue <= listValue else { throw
                        MakingError.outOfStock
                    }
                    fruits[recipieKey] = listValue - recipieValue
                }
            }
        }
    }
}
