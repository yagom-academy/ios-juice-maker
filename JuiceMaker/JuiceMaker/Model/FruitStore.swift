//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: String, CustomStringConvertible, CaseIterable {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var description: String {
        self.rawValue
    }
}

class FruitStore {
    enum InventoryManagementError: Error {
        fileprivate static let outOfStockMessage = "재료가 모자라요. 재고를 수정할까요?"
        fileprivate static let fruitThatDoesNotExistMessage = "해당 과일은 없습니다!"
        
        case inventoryError(description: String)
    }
    
    private(set) var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        let initialNumberOfFruits = 10
        bag[fruit] = initialNumberOfFruits
        return bag
    }
    
    private func increaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        inventory[fruit] = numberOfFruitExist + number
        NotificationCenter.default.post(name: .fruitsAmountDidChange, object: nil, userInfo: [fruit: numberOfFruitExist + number])
    }
    
    private func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        inventory[fruit] = numberOfFruitExist - number
        NotificationCenter.default.post(name: .fruitsAmountDidChange, object: nil, userInfo: [fruit: numberOfFruitExist - number])
    }
    
    private func giveBackNumberIfExist(of fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.fruitThatDoesNotExistMessage)
        }
        return numberOfFruitExist
    }
    
    private func checkStock(amountOfFruitPresent: Int, amountRequired: Int) throws {
        guard amountOfFruitPresent >= amountRequired else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.outOfStockMessage)
        }
    }
    
    func changeAmount(of fruit: Fruit, to number: Int) {
        inventory[fruit] = number
    }
    
    private func checkIngredients(for recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitsExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try giveBackNumberIfExist(of: demand.requiredFruit)
            try checkStock(amountOfFruitPresent: numberOfFruit, amountRequired: demand.requestedAmount)
            numberOfFruitsExist.append(numberOfFruit)
        }
        return numberOfFruitsExist
    }
    
    private func useIngredients(accordingTo recipes: [(requiredFruit: Fruit, requestedAmount: Int)], checkedAmountOfFruits: [Int]) {
        for (index, fruitAmount) in checkedAmountOfFruits.enumerated() {
            decreaseStock(of: recipes[index].requiredFruit, by: recipes[index].requestedAmount, from: fruitAmount)
        }
    }
    
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        let numberOfFruitsExist = try checkIngredients(for: recipes)
        
        useIngredients(accordingTo: recipes, checkedAmountOfFruits: numberOfFruitsExist)
    }
}
