//
//  JuiceMaker - FruitStore.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsList: [Fruits : Int] = [
        .strawberry : 10,
        .banana : 10,
        .pineapple : 10,
        .kiwi : 10,
        .mango : 10
    ]
    
    func checkStock(juice: Juice) throws {
        for (recipieKey, recipieValue) in juice.recipie {
            for (listKey, listValue) in fruitsList {
                if recipieKey == listKey  {
                    guard recipieValue <= listValue else { throw
                        MakingError.outOfStock
                    }
                    fruitsList[recipieKey] = listValue - recipieValue
                }
            }
        }
    }
    
}
