//
//  JuiceMaker - FruitStore.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock = [Fruit.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    func useFruit(juice: Juice) {
        let fruitRemainder = isStocked(juice: juice)
        switch fruitRemainder {
        case .success(let remainder):
            for fruit in remainder {
                fruitStock[fruit.0] = fruit.1
            }
        case .failure(let error):
            print(error.rawValue)
        }
    }

    private func addFruit(fruit: Fruit, amount: Int) throws {
        guard var stock = fruitStock[fruit] else {
            throw JuiceMakerError.invalidFruit
        }
        stock += amount
    }
    
    func isStocked(juice: Juice) -> Result<[(Fruit, Int)], JuiceMakerError> {
        let juice = Juice.selectRecipe(recipe: juice)
        var fruitList: [(Fruit, Int)] = []
        for (fruit, amount) in juice {
            guard let stock = fruitStock[fruit] else {
                return .failure(JuiceMakerError.invalidFruit)
            }
            let newStock = stock - amount
            fruitList.append((fruit, newStock))
            if newStock < 0 {
                return .failure(JuiceMakerError.outOfStock)
            }
        }
        return .success(fruitList)
    }
}

