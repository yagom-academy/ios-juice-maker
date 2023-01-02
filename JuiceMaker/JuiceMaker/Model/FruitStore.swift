//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
}

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    private init() {}
    
    func addStock(fruit: Fruit, amount: Int) {
        guard let selectedFruitStock = fruitStock[fruit] else {
            return
        }
        
        fruitStock.updateValue(selectedFruitStock + amount, forKey: fruit)
    }
    
    func subtractStock(fruit: Fruit, amount: Int) {
        guard let selectedFruitStock = fruitStock[fruit], selectedFruitStock >= amount else {
            return
        }
        
        fruitStock.updateValue(selectedFruitStock - amount, forKey: fruit)
    }
}


