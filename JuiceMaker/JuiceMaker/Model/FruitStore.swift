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
    
    func validateEnoughStock(ingredients: [Fruit: Int]) throws {
        for (fruit, amount) in ingredients {
            guard let stock = fruits[fruit] else {
                throw FruitStoreError.invaildFruit
            }
            if stock < amount {
                throw FruitStoreError.outOfStock
            }
        }
    }
    
    func makeJuice(for ingredients: [Fruit: Int]) {
        do {
            try validateEnoughStock(ingredients: ingredients)
        } catch {
            
        }
        for (ingredient, amount) in ingredients {
            do {
            } catch {
                print("에러")
            }
    
        }
    }
    
    private func useStocks(ingredient: Fruit, amount: Int = 1) throws {
        guard let stocks = fruits[ingredient] else {
            throw FruitStoreError.invaildFruit
        }
        fruits[ingredient] = stocks - amount
    }
}
