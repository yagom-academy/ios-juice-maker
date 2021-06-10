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
        case outOfStock
        case cropThatDoNotExist
    }
    
    private static let initialNumberOfFruits = 10
    private var inventory: [Fruit: Int] = Fruit.allCases.reduce([Fruit: Int]()) { bag, fruit in
        var bag = bag
        bag[fruit] = initialNumberOfFruits
        return bag
    }
    
    func increaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) throws {
        inventory[fruit] = numberOfFruitExist + number
    }
    
    func decreaseStock(of fruit: Fruit, by number: Int, from numberOfFruitExist: Int) throws {
        try checkStock(amountOfCropsPresent: numberOfFruitExist, amountRequired: number)
        inventory[fruit] = numberOfFruitExist - number
    }
    
    func change(numberOf number: Int, fruit: Fruit, isAdd: Bool) throws {
        let numberOfFruitExist = try giveBackNumberIfExist(of: fruit)
        
        if isAdd {
            try increaseStock(of: fruit, by: number, from: numberOfFruitExist)
        } else {
            try decreaseStock(of: fruit, by: number, from: numberOfFruitExist)
        }
    }
    
    func changeForJuice(_ recipe: [(requiredCrop: Fruit, requestedAmount: Int)]) throws {
        for demand in recipe {
            let numberOfFruitExist = try giveBackNumberIfExist(of: demand.requiredCrop)
            try checkStock(amountOfCropsPresent: numberOfFruitExist, amountRequired: demand.requestedAmount)
        }
        try recipe.forEach {
            try change(numberOf: $0.requestedAmount, fruit: $0.requiredCrop, isAdd: false)
        }
    }
    
    private func giveBackNumberIfExist(of fruit: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[fruit] else {
            throw InventoryManagementError.cropThatDoNotExist
        }
        return numberOfFruitExist
    }
    
    private func checkStock(amountOfCropsPresent: Int, amountRequired: Int) throws {
        guard amountOfCropsPresent >= amountRequired else {
            throw InventoryManagementError.outOfStock
        }
    }
}
