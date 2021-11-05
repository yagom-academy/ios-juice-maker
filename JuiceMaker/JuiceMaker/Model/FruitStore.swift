//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitStock = (fruit: Fruit, stock: Int)

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

private enum Const {
    static let defaultFruitCount = 10
}

class FruitStore {
    private var fruitBasket: [Fruit: Int]
    
    init(count: Int = Const.defaultFruitCount) {
        let allFruits = Fruit.allCases
        let fruitscount = Array(repeating: count, count: allFruits.count)
        
        self.fruitBasket = Dictionary(uniqueKeysWithValues: zip(allFruits, fruitscount))
    }
    
    func stock(fruit: Fruit) throws -> Int {
        guard let fruitStock = fruitBasket[fruit] else {
            throw RequestError.fruitNotFound
        }
        return fruitStock
    }
    
    func addFruitStock(fruit: Fruit, count: Int) throws {
        try changeAmount(count: count, of: fruit, by: +)
    }
    
    func subtractFruitStock(fruit: Fruit, count: Int) throws {
        try changeAmount(count: count, of: fruit, by: -)
    }
    
    private func changeAmount(count: Int, of fruit: Fruit, by calculator: (Int, Int) -> Int) throws {
        guard count > 0 else {
            throw RequestError.wrongCount
        }
        guard let oldFruitCount = fruitBasket[fruit] else {
            throw RequestError.fruitNotFound
        }
        let newFruitCount = calculator(oldFruitCount, count)
        guard newFruitCount >= 0 else {
            throw RequestError.fruitStockOut
        }
        fruitBasket[fruit] = newFruitCount
        
        let fruitStock = (fruit: fruit, stock: newFruitCount)
        
        NotificationCenter.default.post(name: .changedFruitStockNotification, object: fruitStock)
    }
    
    func hasFruitStock(of fruit: Fruit, count fruitCountSubtracted: Int) -> Bool {
        guard let currentFruitAmount = fruitBasket[fruit] else { return false }
        return currentFruitAmount >= fruitCountSubtracted
    }
}


extension Notification.Name {
    static let changedFruitStockNotification = Notification.Name("changeFruitStock")
}
