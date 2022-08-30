//
//  JuiceMaker - FruitStore.swift
//  Created by 써니쿠키, SummerCat
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitStock: Dictionary<Fruit, Int> = [
        .strawberry : 10,
        .banana : 10,
        .pineapple : 10,
        .kiwi : 10,
        .mango : 10,
    ]
    
    func changeStockOf(fruit: Fruit, by quantity: Int) {
        guard let currentStock = fruitStock[fruit] else {
            return
        }
        
        fruitStock[fruit] = currentStock + quantity
    }
    
    func checkStockOf(_ ingredient: Fruit, total: Int) throws {
        guard let curStock = fruitStock[ingredient] else {
            throw JuiceMakerError.noSuchFruit
        }
        
        guard curStock >= total else {
            throw JuiceMakerError.stockShortage
        }
    }
}
