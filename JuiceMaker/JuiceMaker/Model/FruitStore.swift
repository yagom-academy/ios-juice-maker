//
//  JuiceMaker - FruitStore.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock:[FruitType: Int] = [.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    func makeJuice(juice: Recipe) throws {
        let recipe = Recipe.selectRecipe(recipe: juice)
        for (key, value) in recipe {
            guard let stock = fruitStock[key] else {
                throw JuiceMakerError.invalidFruit
            }
            let amount = value
            let newStock = stock - amount
            fruitStock[key] = newStock
        }
    }
}

