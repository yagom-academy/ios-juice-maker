//
//  JuiceMaker - JuiceMaker.swift
//  Created by stone, jpush.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    typealias Amount = Int
    
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        let juiceRecipe = juice.recipe
        
        do {
            try validFruitAmount(for: juiceRecipe)
            try fruitStore.useFruits(for: juiceRecipe)
            print("\(juice.name) 완성")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func validFruitAmount(for recipe : [Fruit : Amount]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fruitStore.fetchFruitAmount(for: fruit)
            guard amount <= fruitAmount else { throw JuiceMakerError.fruitAmountError }
        }
    }
}
