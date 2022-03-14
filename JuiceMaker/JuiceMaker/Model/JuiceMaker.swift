// JuiceMaker.swift
//  Created by Quokka, Donnie

import Foundation

struct JuiceMaker {
    private(set) var fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) throws {
        try fruitStore.makeReady(for: juice)
        subtractFruitQuantity(for: juice)
    }
    
    private func subtractFruitQuantity(for juice: Juice) {
        juice.recipe.forEach { (fruit: FruitStore.Fruit, count: Int) in
            fruitStore.changeFruitQuantity(by: fruit, count: count)
        }
    }
}
