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
            try validFruitCount(juiceRecipe)
            try fruitStore.induceFruit(recipe: juiceRecipe)
        
        } catch {
            print(error.localizedDescription)
        }
        
        print("\(juice.rawValue) 완성")
    }
    
    func validFruitCount(_ recipe : [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fruitStore.fetchFruitCount(fruit: fruit)
            guard amount <= fruitAmount else { throw JuiceMakerError.fruitAmountError }
        }
    }
}
