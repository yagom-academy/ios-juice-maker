//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(juice: Juice) throws -> Juice {
        let unavailableFruits = getUnavailableFruit(juice: juice)
        
        guard unavailableFruits.count == 0 else {
            throw FruitStoreError.insufficientFruits(unavailabeFruits: unavailableFruits)
        }
        
        for (fruit, amount) in juice.ingredients {
            fruitStore.changeInventory(fruit, by: amount)
        }
        return juice
    }
  
    func getUnavailableFruit(juice: Juice) -> [Fruit:Int] {
        let unavailableFruits = juice.ingredients.filter( {(fruit: Fruit, amount: Int) -> Bool in
            return fruitStore.isAvailable(fruit: fruit, amount: amount) == false
        })
        return unavailableFruits
    }
}

struct Juice {
    var name: String
    var ingredients: [Fruit : Int] = [:]
    
    init(name: String, ingredientList: [(Fruit, Int)]) {
        self.name = name
        for (fruit, amount) in ingredientList {
            ingredients[fruit] = amount
        }
    }
}
    

