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
    static let initialNumberOfFruits = 10
    var inventory: [Fruit: Int] = Fruit.allCases.reduce([Fruit: Int]()) { bag, crop in
        var bag = bag
        bag[crop] = initialNumberOfFruits
        return bag
    }
    
    func change(numberOf number: Int, crop: Fruit, isAdd: Bool) throws {
        let numberOfFruitExist = try checkExistAndGiveBackNumber(of: crop)
        
        if isAdd {
            inventory[crop] = numberOfFruitExist + number
            return
        }
        try checkStock(amountOfCropsPresent: numberOfFruitExist, amountRequired: number)
        inventory[crop] = numberOfFruitExist - number
    }
    
    func checkExistAndGiveBackNumber(of crop: Fruit) throws -> Int {
        guard let numberOfFruitExist = inventory[crop] else {
            throw InventoryManagementError.cropThatDoNotExist
        }
        return numberOfFruitExist
    }
    
    func checkStock(amountOfCropsPresent: Int, amountRequired: Int) throws {
        guard amountOfCropsPresent >= amountRequired else {
            throw InventoryManagementError.outOfStock
        }
    }
    
    enum InventoryManagementError: Error {
        case outOfStock
        case cropThatDoNotExist
    }
}
