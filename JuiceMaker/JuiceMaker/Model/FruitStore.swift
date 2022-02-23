//
//  JuiceMaker - FruitStore.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitList = [Fruits: Int]()
    
    init() {
        let defaultStock = 10
        Fruits.allCases.forEach{ fruitList[$0] = defaultStock }
    }
    
    func checkStock(juice: Juice) throws {
        for (ingredent, amount) in juice.recipie {
            guard let stock = fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
            fruitList[ingredent] = stock - amount
        }
    }

    func calculateStock(fruit: Fruits, amount: Int, calculationType: CalculationType) throws {
        guard let stock = fruitList[fruit] else {
            throw FruitStoreError.invalidSelection
        }
        if calculationType == .plus {
            fruitList[fruit] = stock + amount
        } else {
            guard stock >= amount else {
                throw FruitStoreError.outOfRange
            }
            fruitList[fruit] = stock - amount
        }
    }
}
