//
//  JuiceMaker - FruitStore.swift
//  Created by Rhode, Christy. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock = [Fruit.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    static let shared = FruitStore()
    private init() {}
    
    func useFruit(juice: Juice) -> [Fruit: Int]? {
        let fruitRemainder = isStocked(juice: juice)
        switch fruitRemainder {
        case .success(let remainder):
            for fruit in remainder {
                fruitStock[fruit.fruit] = fruit.stock
            }
            return fruitStock
        case .failure(let error):
            print(error.rawValue)
            return nil
        }
    }
    

    func modifyFruitStocks(fruit: Fruit, amount: Int) {
        fruitStock[fruit] = amount
    }
    
    private func isStocked(juice: Juice) -> Result<[(fruit: Fruit, stock: Int)], JuiceMakerError> {
        let juice = juice.selectRecipe
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

