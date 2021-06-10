//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
}

enum Fruit: CaseIterable {
    static let defaultStock = 10
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
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
    
    func makeJuice(for ingredients: [Fruit: Int]) {
        for (ingredient, amount) in ingredients {
            useStocks(ingredient: ingredient, amount: amount)
        }
    }
    
    private func useStocks(ingredient: Fruit, amount: Int = 1) {
        guard let stocks = fruits[ingredient] else {
            return
        }
        fruits[ingredient] = stocks - amount
    }
}
