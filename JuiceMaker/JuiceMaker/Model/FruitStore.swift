//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

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
    
    func decreaseFruitStock(fruit: HandlingFruit, amount: Int){
        if var selectedFruitStock = fruitStock[fruit], 0 <= (selectedFruitStock - amount) {
            selectedFruitStock -= amount
            fruitStock[fruit] = selectedFruitStock
        }
    }
}

