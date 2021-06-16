//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
class JuiceMaker {
    let fruitStore = FruitStore.shared

    func makeJuice(_ juice: Juice, _ completion: @escaping (Result<String, JuiceMakerError>) -> Void) {
        do {
            try checkStock(juice.ingredients)
            for (fruit, removingQuantities) in juice.ingredients {
                fruitStore.changeStock(fruit, removingQuantities)
            }
            completion(.success(juice.description))
        } catch {
            completion(.failure(.outOfStock))
        }
    }
    
    func checkStock(_ ingredients: [(Fruit, UInt)]) throws {
        for (fruit, removingQuantities) in ingredients {
            do {
                if fruitStore[fruit] < removingQuantities {
                    throw JuiceMakerError.outOfStock
                }
            }
        }
    }
}
