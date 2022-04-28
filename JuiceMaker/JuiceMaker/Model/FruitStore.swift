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
    
    private func usedLeftover(_ fruit: Fruit, by amount :Int) throws {
        guard let stock = fruitInventory[fruit] else {
            throw JuiceMakerError.outOfStock
        }
        guard stock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        fruitInventory[fruit] = stock - amount
        print("남은 \(fruit)의 수: \(fruitInventory[fruit] ?? 0)")
    }
    
    func make(_ fruitJuice: FruitJuice) throws -> FruitJuice {
        for (fruit, amount) in fruitJuice.getRecipe() {
            try usedLeftover(fruit, by: amount)
        }
        return fruitJuice
    }
}
