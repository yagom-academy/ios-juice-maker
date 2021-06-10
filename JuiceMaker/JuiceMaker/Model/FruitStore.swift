//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
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
    let defaultStock: Int = 10
    var fruitStock: [HandlingFruit:Int] = [:]
    
    init() {
        for i in HandlingFruit.allCases {
            fruitStock[i] = defaultStock
        }
    }
    
    func increaseFruitStock(fruit: HandlingFruit, amount: Int) {
        if var selectedFruitStock = fruitStock[fruit] {
            selectedFruitStock += amount
            fruitStock[fruit] = selectedFruitStock
        }
    }
    
    func decreaseFruitStock(fruit: HandlingFruit, amount: Int) {
        guard let selectedFruitStock = fruitStock[fruit] else {
            return
        }
        let changedStock = selectedFruitStock - amount
        fruitStock[fruit] = changedStock
    }
    
    func checkFruitStock(fruit: HandlingFruit) throws -> Int {
        guard let selectedFruitStock = fruitStock[fruit], selectedFruitStock >= 0 else {
            throw FruitStoreError.outOfStock
        }
        return selectedFruitStock
    }
}

