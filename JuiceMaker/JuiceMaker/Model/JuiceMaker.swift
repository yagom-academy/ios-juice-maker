//
//  JuiceMaker - JuiceMaker.swift
//  Created by stone, jpush.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        let juiceRecipe = juice.recipe
        
        do {
            try validFruitAmount(juiceRecipe)
            try fruitStore.useFruits(recipe: juiceRecipe)
            print("\(juice.rawValue) 완성")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func validFruitAmount(_ recipe : [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fruitStore.fetchFruitAmount(fruit: fruit)
            guard amount <= fruitAmount else { throw JuiceMakerError.fruitAmountError }
        }
    }
}
