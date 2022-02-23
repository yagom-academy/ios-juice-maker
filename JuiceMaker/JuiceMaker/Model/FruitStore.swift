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
        let defaultStock = 10
        Fruits.allCases.forEach{ fruits[$0] = defaultStock }
    }
    
    func checkStock(juice: Juice) throws {
        for (recipieKey, recipieValue) in juice.recipie {
            guard let stock = fruits[recipieKey] else {
                throw MakingError.invalidSelection
            }
            guard recipieValue <= stock else {
                throw MakingError.outOfStock
            }
            fruits[recipieKey] = stock - recipieValue
        }
    }
}
