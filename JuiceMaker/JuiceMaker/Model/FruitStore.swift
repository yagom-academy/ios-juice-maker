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
    private var fruitStockList: [Fruit: FruitStock] = [:]
    
    init(initialFruitStock: FruitStock = 10) {
        for fruitName in Fruit.allCases {
            fruitStockList[fruitName] = initialFruitStock
        }
    }

    func changeFruitStock(fruitName: Fruit, changingNumber: Int) throws {
        guard let currentFruitStock = fruitStockList[fruitName] else {
            throw FruitStockError.fruitNotExist
        }
        guard (currentFruitStock + changingNumber) >= 0 else {
            throw FruitStockError.lessThanZero
        }
        
        fruitStockList[fruitName] = (currentFruitStock + changingNumber)
    }
    
    func isHaveEnoughStock(fruitName: Fruit, juiceIngredient: JuiceIngredient) throws {
        guard let fruitStock = fruitStockList[fruitName] else {
            throw FruitStockError.fruitNotExist
        }
        guard fruitStock >= juiceIngredient else {
            throw FruitStockError.outOfStock
        }
    }
}

enum FruitStockError: Error {
    case fruitNotExist
    case outOfStock
    case lessThanZero
}
