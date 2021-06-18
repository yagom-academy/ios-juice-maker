//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
    case invaildFruit
}

enum Fruit: String, CaseIterable {
    static let defaultStock = 10
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case mango = "망고"
}

class FruitStore {
    var fruits: [Fruit: Int]
    
    init() {
        var fruits = [Fruit: Int]()
        for key in Fruit.allCases {
            fruits[key] = Fruit.defaultStock
        }
        self.fruits = fruits
    }
    
    private func validateEnoughStocks(ingredients: [Fruit: Int]) throws {
        for (fruit, amount) in ingredients {
            guard let stock = fruits[fruit] else {
                throw FruitStoreError.invaildFruit
            }
            if stock < amount {
                throw FruitStoreError.outOfStock
            }
        }
    }
    
    private func decreaseStock(ingredient: Fruit, amount: Int = 1) throws {
        guard let stocks = fruits[ingredient] else {
            throw FruitStoreError.invaildFruit
        }
        fruits[ingredient] = stocks - amount
    }
    
    private func useStocks(ingredients: [Fruit: Int]) {
        for (fruit, amount) in ingredients {
            fruits[fruit]? -= amount
        }
    }
    
    func makeJuice(for ingredients: [Fruit: Int]) throws {
        try validateEnoughStocks(ingredients: ingredients)
        useStocks(ingredients: ingredients)
    }
}
