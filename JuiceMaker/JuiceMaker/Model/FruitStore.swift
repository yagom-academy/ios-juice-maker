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
    
    private static let initialNumberOfFruits = 10
    private var inventory = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        bag[fruit] = initialNumberOfFruits
        return bag
    }
    
    func increaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        inventory[fruit] = numberOfFruitExist + number
    }
    
    func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) {
        inventory[fruit] = numberOfFruitExist - number
    }
    
    func change(numberOf number: Int, fruit: Fruit, isAdd: Bool) throws {
        let numberOfFruitExist = try giveBackNumberIfExist(of: fruit)
        
        if isAdd {
            increaseStock(of: fruit, by: number, from: numberOfFruitExist)
        } else {
            try checkStock(amountOfCropsPresent: numberOfFruitExist, amountRequired: number)
            decreaseStock(of: fruit, by: number, from: numberOfFruitExist)
        }
    }
    
    func consumeStocks(_ recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws {
        let numberOfFruitsExist = try checkIngredients(for: recipes)
        
        for (recipe, numberOfFruit) in zip(recipes, numberOfFruitsExist) {
            decreaseStock(of: recipe.requiredFruit, by: recipe.requestedAmount, from: numberOfFruit)
        }
    }
    
    private func giveBackNumberIfExist(of fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.fruitThatDoesNotExistMessage)
        }
        return numberOfFruitExist
    }
    
    private func checkStock(amountOfCropsPresent: Int, amountRequired: Int) throws {
        guard amountOfCropsPresent >= amountRequired else {
            throw InventoryManagementError.inventoryError(description: InventoryManagementError.outOfStockMessage)
        }
    }
    
    func checkIngredients(for recipes: [(requiredFruit: Fruit, requestedAmount: Int)]) throws -> [Int] {
        var numberOfFruitsExist = [Int]()
        
        for demand in recipes {
            let numberOfFruit = try giveBackNumberIfExist(of: demand.requiredFruit)
            try checkStock(amountOfCropsPresent: numberOfFruit, amountRequired: demand.requestedAmount)
            numberOfFruitsExist.append(numberOfFruit)
        }
        return numberOfFruitsExist
    }
    
    func useIngredients(accordingTo recipes: [(requiredFruit: Fruit, requestedAmount: Int)], checkedAmountOfFruits: [Int]) {
        for (recipe, numberOfFruit) in zip(recipes, checkedAmountOfFruits) {
            decreaseStock(of: recipe.requiredFruit, by: recipe.requestedAmount, from: numberOfFruit)
        }
    }
}
