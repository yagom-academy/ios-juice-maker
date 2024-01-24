//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

class FruitStore {
    var fruitStorage: [Fruit: Int]

    init(initialStock: [Fruit: Int]) {
        fruitStorage = initialStock
    }
    
    func changeFruitQuantity(fruitName: Fruit, quantity: Int) {
        fruitStorage[fruitName] = quantity
    }

    func showFruitQuantity(fruitsStock: [Fruit: Int], amount: Int) throws -> String {
        for (fruit, useQuantity) in fruitsStock {
            let requestFruit = useQuantity * amount
            let storeFruit = fruitStorage[fruit] ?? 0
            
            if requestFruit > storeFruit {
                throw FruitResultError.outOfStock
            }
        }
        
        return "availableMakeJuice"
    }
}





