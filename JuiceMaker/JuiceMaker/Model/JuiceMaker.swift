//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    private let juiceRecipes: [Juice: [Fruit: Int]] = [
        .strawberry: [.strawberry: 16],
        .banana: [.banana: 2],
        .kiwi: [.kiwi: 3],
        .pineapple: [.pineapple: 2],
        .strawNana: [.strawberry: 10, .banana: 1],
        .mango: [.mango: 3],
        .mangKi: [.mango: 2, .kiwi: 1]
    ]

    private func useFruits(_ fruit: Fruit, _ amount: Int) throws {
        let stockUpdateResult = fruitStore.updateStock(of: fruit, by: amount, operation: .consume)
        
        switch stockUpdateResult {
        case .success:
            break
        case .failure(let error):
            throw error
        }
    }
    
    private func makeJuice(_ juice: Juice) throws {
        guard let recipe = juiceRecipes[juice] else {
            throw FruitJuiceError.notFountJuiceRecipe
        }
        
        for (fruit, amount) in recipe {
            try useFruits(fruit, amount)
        }
    }
    
    private func canMakeJuice(_ juice: Juice, orderCount: Int) -> Bool {
        guard let recipes = juiceRecipes[juice] else {
            return false
        }
        
        for (fruit, recipeAmount) in recipes {
            guard let stock = fruitStore.checkStock(of: fruit), stock >= recipeAmount * orderCount else {
                return false
            }
        }
        return true
    }
    
    func takeOrder(_ juice: Juice, count: Int) {
        var successfulJuicesCount = 0
        
        for _ in 1...count {
            let juiceMakingResult = makeJuice(juice)
            
            do {
                try makeJuice(juice)
                print("\(juice.rawValue)쥬스 \(count)잔 나왔습니다.")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
