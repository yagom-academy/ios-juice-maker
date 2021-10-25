//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private let defaultFruitCount = 10

class FruitStore {
    
    static let shared: FruitStore = FruitStore()
    
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private var fruitBasket: [Fruit: Int]
    
    init(count: Int = defaultFruitCount) {
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
        guard count <= oldFruitCount else {
            throw RequestError.fruitStockOut
        }
        let newFruitCount = calculator(oldFruitCount, count)
        fruitBasket[fruit] = newFruitCount
        
        NotificationCenter.default.post(name: .changedFruitStockNotification, object: fruit)
    }
    
    func hasFruitStock(of fruit: Fruit, count fruitCountSubtracted: Int) -> Bool {
        guard let currentFruitAmount = fruitBasket[fruit] else { return false }
        return currentFruitAmount >= fruitCountSubtracted
    }
}


extension Notification.Name {
    static let changedFruitStockNotification = Notification.Name("changeFruitStock")
}
