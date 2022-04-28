//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [Fruit:Int] = [:]
    let initialAmount: Int
    
    init(initialAmount: Int) {
        self.initialAmount = initialAmount
        fruitInventory = [
            .strawberry: initialAmount,
            .banana: initialAmount,
            .kiwi: initialAmount,
            .pineapple: initialAmount,
            .mango: initialAmount
        ]
    }
    
    private func usedLeftover(_ fruit: Fruit, by amount :Int) {
        guard (fruitInventory[fruit]? -= amount) != nil else {
            return
        }
        print("남은 \(fruit)의 수: \(fruitInventory[fruit] ?? 0)")
    }
    
    private func checkInventory(about fruit: Fruit, by amount :Int) throws {
        guard let stock = fruitInventory[fruit],
              stock >= amount else {
            throw JuiceMakerError.outOfStock
        }
    }
    
    private func checkGenerationAvailable(_ fruitJuice: FruitJuice) throws {
        for (fruit, amount) in fruitJuice.getRecipe() {
            try checkInventory(about: fruit, by: amount)
        }
    }
    
    private func generate(_ fruitJuice: FruitJuice) {
        for (fruit, amount) in fruitJuice.getRecipe() {
            usedLeftover(fruit, by: amount)
        }
    }
    
    func make(_ fruitJuice: FruitJuice) throws {
        try checkGenerationAvailable(fruitJuice)
        generate(fruitJuice)
    }
}
