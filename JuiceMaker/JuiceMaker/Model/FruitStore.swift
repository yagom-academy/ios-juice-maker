//
//  JuiceMaker - FruitStore.swift
//  Created by luyan. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
}

enum HandlingFruit: String, CaseIterable {
    case strawberry
    case banana
    case fineapple
    case kiwi
    case mango
}

class FruitStore {
    static let shared = FruitStore()
    
    private let defaultStock: Int = 10
    private var fruitStock: [HandlingFruit: Int] = [: ]
    
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
    
    func isIngredientOutOfStock(ingredients: [HandlingFruit: Int]) throws -> Bool {
        let totalIngrdients = ingredients.map { return ($0, $1) }
        for fruit in totalIngrdients {
            if try haveEnoughFruitToMakeJuice(fruit: fruit) == false {
                return true
            }
        }
        return false
    }
    
    func haveEnoughFruitToMakeJuice(fruit: (name: HandlingFruit,stock: Int)) throws -> Bool {
        guard let selectedFruitStock = fruitStock[fruit.name], selectedFruitStock >= fruit.stock else {
            throw FruitStoreError.outOfStock
        }
        return true
    }
}

