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

    func changeFruitStock(fruitName: FruitStore.Fruit, changingNumber: Int) throws {
        guard let currentFruitStock = stock.fruitStockList[fruitName] else {
            throw FruitStockError.fruitNotExist
        }
        let fruitStock = (currentFruitStock + changingNumber)
        guard fruitStock >= 0 else {
            throw FruitStockError.lessThanZero
        }
        stock.fruitStockList[fruitName] = fruitStock
    }
}

func isHaveEnoughStock(fruitName: FruitStore.Fruit, juiceIngredient: JuiceIngredient) throws {
    guard let fruitStock = stock.fruitStockList[fruitName] else {
        throw FruitStockError.fruitNotExist
    }
    guard fruitStock >= juiceIngredient else {
        throw FruitStockError.outOfStock
    }
}


enum FruitStockError: Error {
    case fruitNotExist
    case outOfStock
    case lessThanZero
}

let stock = FruitStore.shared
