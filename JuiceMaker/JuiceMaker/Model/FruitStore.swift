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
        guard let numberOfFruitExist = inventory[crop] else {
            throw InventoryManagementError.cropThatDoNotExist
        }
        if isAdd {
            inventory[crop] = numberOfFruitExist + number
            return
        } else if numberOfFruitExist >= number {
            throw InventoryManagementError.outOfStock
        } else {
            inventory[crop] = numberOfFruitExist - number
        }
        
    }
    enum InventoryManagementError: Error {
        case outOfStock
        case cropThatDoNotExist
    }
}
