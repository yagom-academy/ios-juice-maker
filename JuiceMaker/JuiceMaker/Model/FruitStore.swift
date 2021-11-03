//
//  JuiceMaker - FruitStore.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    typealias FruitStock = Int
    
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    var fruitStockList: [Fruit: FruitStock] = [:]
    
    static let shared: FruitStore = FruitStore()
    
    private init(initialFruitStock: FruitStock = 10) {
        for fruitName in Fruit.allCases {
            fruitStockList[fruitName] = initialFruitStock
        }
    }
    
    func changeFruitStock(fruitName: FruitStore.Fruit, changingNumber: Int) -> Bool {
        guard let currentFruitStock = stock.fruitStockList[fruitName] else {
            return false
        }
        let fruitStock = (currentFruitStock + changingNumber)
        guard fruitStock >= 0 else {
            return false
        }
        stock.fruitStockList[fruitName] = fruitStock
        return true
    }
}

let stock = FruitStore.shared
