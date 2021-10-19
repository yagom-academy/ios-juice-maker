//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    enum Errors: Error {
        case noneOfInput
        case invalidValue
    }

    var defaultStock : Int
    var fruitStorage : Dictionary<Fruit, Int>
    let allFruits : Array<Fruit>
    let stock : Array<Int>

    init() {
        defaultStock = 10
        allFruits = Fruit.allCases
        stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }

    func useFruit(fruit: Fruit, amount: Int) throws {
        guard var inventory = fruitStorage[fruit] else {
            throw Errors.invalidValue
        }
        inventory -= amount
        fruitStorage[fruit] = inventory
    }
}
