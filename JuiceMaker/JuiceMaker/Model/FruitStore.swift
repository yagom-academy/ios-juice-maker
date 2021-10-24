//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    private var defaultStock : Int
    var fruitStorage : Dictionary<Fruit, Int>
    private let allFruits : Array<Fruit>
    private let stock : Array<Int>

    init() {
        defaultStock = 10
        allFruits = Fruit.allCases
        stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }

    func checkEnoughFruit(which fruit: Fruit, on amount: Int) throws {
        guard let inventory = fruitStorage[fruit] else {
            throw Errors.invalidValue
        }

        guard inventory >= amount else {
            throw Errors.outOfStock
        }
    }

    func useFruit(fruit: Fruit, amount: Int) {
        fruitStorage[fruit]? -= amount
    }

    func stockUpFruit(which fruit: Fruit, on amount: Int) throws {
        guard var inventory = fruitStorage[fruit] else {
            throw Errors.invalidValue
        }
        inventory += amount
        fruitStorage[fruit] = inventory
    }
}
