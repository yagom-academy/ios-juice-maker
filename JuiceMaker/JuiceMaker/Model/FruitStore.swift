//
//  JuiceMaker - FruitStore.swift
//  Created by luyan. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
}

class FruitStore {
    enum HandlingFruit: String, CaseIterable {
        case strawberry
        case banana
        case fineapple
        case kiwi
        case mango
    }
    
    static let shared = FruitStore()
    
    private let defaultStock: Int = 10
    private(set) var fruitStock: [HandlingFruit: Int] = [: ]
    
    private init() {
        fruitStock = HandlingFruit.allCases.reduce(into: [: ]) { fruitStock, HandlingFruit in
            fruitStock[HandlingFruit] = defaultStock
        }
    }
    
    func changeFruitStock(fruit: HandlingFruit, amount: Int) {
        fruitStock[fruit] = amount
    }
    
    func useFruitToMakeJuice(ingredients: [HandlingFruit: Int]) {
        for fruit in ingredients {
            guard let selectedFruitStock = fruitStock[fruit.key] else { return }
            fruitStock[fruit.key] = selectedFruitStock - fruit.value
        }
    }
    
    func isAllIngredientEnough(ingredients: [HandlingFruit: Int]) throws {
        let totalIngrdients = ingredients.map { return ($0, $1) }
        for fruit in totalIngrdients {
            try haveEnoughFruit(fruit: fruit)
        }
    }
    
    private func haveEnoughFruit(fruit: (name: HandlingFruit,stock: Int)) throws {
        guard let selectedFruitStock = fruitStock[fruit.name], selectedFruitStock >= fruit.stock else {
            throw FruitStoreError.outOfStock
        }
    }
}
