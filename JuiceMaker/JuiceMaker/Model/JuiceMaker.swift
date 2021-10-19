//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore: FruitStore
    init(amount: Int) {
        fruitStore = FruitStore(fruits: [.strawberry, .bananna, .pineapple, .kiwi, .mango], amount: amount)
    }
    
    func make(juice: Juice) -> Juice? {
        guard checkFruit(juice: juice).count == 0 else {
            return nil
        }
        return juice
    }
    
    func checkFruit(juice: Juice) -> [Fruit:Int] {
        let unAvailableFruits = juice.ingredients.filter( {(fruit: Fruit, amount: Int) -> Bool in
            return fruitStore.isAvailable(fruit: fruit, amount: amount) == false
        })
        return unAvailableFruits
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
