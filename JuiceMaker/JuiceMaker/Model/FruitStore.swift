//
//  JuiceMaker - FruitStore.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStock = [Fruit.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    func useFruit(juice: Juice) throws {
        let juice = Juice.selectRecipe(recipe: juice)
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                throw JuiceMakerError.invalidFruit
            }
            let newStock = stock - amount
            fruitStock[fruit] = newStock
        }
    }
    
    private func addFruit(fruit: Fruit, amount: Int) throws {
        guard var stock = fruitStock[fruit] else {
            throw JuiceMakerError.invalidFruit
        }
        stock += amount
    }
    
    func isStocked(juice: Juice) -> Bool {
        let juice = Juice.selectRecipe(recipe: juice)
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                return false
            }
            if stock < amount {
                return false
            }
        }
        return true
    }
}

