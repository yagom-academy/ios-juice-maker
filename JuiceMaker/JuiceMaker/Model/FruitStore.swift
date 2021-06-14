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
    private var fruitStock: [HandlingFruit: Int] = [:]
    
    private init() {
        for fruit in HandlingFruit.allCases {
            fruitStock[fruit] = defaultStock
        }
    }
    
    func setFruitStock(fruit: HandlingFruit, amount: Int) {
        fruitStock[fruit] = amount
    }
    
    func decreaseFruitStock(fruit: HandlingFruit, amount: Int) {
        guard let selectedFruitStock = fruitStock[fruit], selectedFruitStock - amount >= 0 else { return }
        let changedStock = selectedFruitStock - amount
        fruitStock[fruit] = changedStock
    }
    
    func checkFruitStock(fruit: HandlingFruit) throws -> Int {
        guard let selectedFruitStock = fruitStock[fruit], selectedFruitStock >= 0 else {
            throw FruitStoreError.outOfStock
        }
        return selectedFruitStock
    }
    
    func printFruitStock(){
        for i in fruitStock {
            print(i)
        }
    }
}

