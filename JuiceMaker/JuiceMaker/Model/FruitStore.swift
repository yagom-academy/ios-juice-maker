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
    
    init(initialFruitStock: Int = 10) {
        for fruitName in Fruit.allCases {
            fruitStockList[fruitName] = initialFruitStock
        }
    }
    
    func addFruitStock(fruitName: Fruit, plus number: Int) {
        guard let fruitStock = fruitStockList[fruitName] else { return }
        fruitStockList[fruitName] = fruitStock + number
    }
    
    func substractFruitStock(fruitName: Fruit, minus number: Int) {
        guard let fruitStock = fruitStockList[fruitName],
            fruitStock >= number else { return }
        fruitStockList[fruitName] = fruitStock - number
    }
    
    func isHaveEnoughStock(for menu: JuiceMaker.Juice) -> Bool {
        for (fruitName, juiceIngredient) in menu.recipe {
            guard let fruitStock = fruitStockList[fruitName],
                  fruitStock >= juiceIngredient else { return false }
        }
        return true
    }
}
