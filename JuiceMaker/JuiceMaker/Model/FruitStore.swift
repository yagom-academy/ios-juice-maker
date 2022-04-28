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
    
    private func canUseStock(of fruit: Fruit, by amount :Int) throws -> Bool {
        guard let stock = fruitInventory[fruit] else {
            throw JuiceMakerError.invalidOrder
        }
        guard stock >= amount else {
            return false
        }
        fruitInventory[fruit] = stock - amount
        return true
    }
    
    func make(_ fruitJuice: FruitJuice) throws -> FruitJuice? {
        var canComplete = true
        for (fruit, amount) in fruitJuice.getRecipe() {
            canComplete = try canUseStock(of: fruit, by: amount) && canComplete
        }
        return canComplete ? fruitJuice : nil
    }
}

