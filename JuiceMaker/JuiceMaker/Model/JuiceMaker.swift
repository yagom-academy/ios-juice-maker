//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
class JuiceMaker: FruitStore {
    
    struct Juice {
        let juiceName: String
        let recipe: [(Fruit, Int)]
        
        init(name: String, recipe: [(Fruit, Int)]) {
            self.juiceName = name
            self.recipe = recipe
        }
    }
    
    let strawberryJuice = Juice(name: "딸기주스", recipe: [(FruitStore.Fruit.strawberry, 16)])
    let bananaJuice = Juice(name: "바나나주스", recipe: [(FruitStore.Fruit.banana, 2)])
    let pineappleJuice = Juice(name: "파인애플주스", recipe: [(FruitStore.Fruit.pineapple, 2)])
    let kiwiJuice = Juice(name: "키위주스", recipe: [(FruitStore.Fruit.kiwi, 3)])
    let mangoJuice = Juice(name: "망고주스", recipe: [(FruitStore.Fruit.mango, 3)])
    let strawberryAndBananaJuice = Juice(name: "딸바주스", recipe: [(FruitStore.Fruit.strawberry, 10), (FruitStore.Fruit.banana, 1)])
    let mangoAndKiwiJuice = Juice(name: "망고키위주스", recipe: [(FruitStore.Fruit.mango, 2), (FruitStore.Fruit.kiwi, 1)])
    
}
