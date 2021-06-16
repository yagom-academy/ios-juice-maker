//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Juice {
    let name: String
    let ingredients: Dictionary<Fruit, UInt>
}
// 쥬스 메이커 타입 
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    let menuOfJuice: Dictionary<String, Juice> = [
        "딸기쥬스 주문":Juice(name: "딸기", ingredients: [.strawberry: 16]),
        "바나나쥬스 주문":Juice(name: "바나나", ingredients: [.banana: 2]),
        "파인애플쥬스 주문":Juice(name: "파인애플", ingredients: [.pineapple: 2]),
        "키위쥬스 주문":Juice(name: "키위", ingredients: [.kiwi: 3]),
        "망고쥬스 주문":Juice(name: "망고", ingredients: [.mango: 3]),
        "딸바쥬스 주문":Juice(name: "딸바", ingredients: [.strawberry: 10, .banana: 1]),
        "망키쥬스 주문":Juice(name: "망키", ingredients: [.mango: 2, .kiwi: 1])
    ]

    func makeJuice(_ juice: Juice, _ completion: @escaping (Result<String, JuiceMakerError>) -> Void) {
        do {
            try checkStock(juice.ingredients)
            for (fruit, removingQuantities) in juice.ingredients {
                fruitStore.changeStock(fruit, removingQuantities)
            }
            completion(.success(juice.name))
        } catch {
            completion(.failure(.outOfStock))
        }
    }
    func checkStock(_ ingredients: Dictionary<Fruit, UInt>) throws {
        for (fruit, removingQuantities) in ingredients {
            do {
                if fruitStore[fruit] < removingQuantities {
                    throw JuiceMakerError.outOfStock
                }
            }
        }
    }
}


