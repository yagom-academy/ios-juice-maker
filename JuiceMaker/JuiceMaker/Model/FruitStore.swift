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
    
    func checkStock(ingredient: Juice, fruit: Fruits) throws {
            guard let toMake = ingredient.recipie[fruit] else {
                throw MakingError.invalidSelection
            }
            guard var stock = fruitsList[fruit] else {
                throw MakingError.invalidSelection
            }
            guard stock < toMake else {
                throw MakingError.outOfStock
            }

            stock -= toMake
            fruitsList[fruit] = stock
        }
    
}
