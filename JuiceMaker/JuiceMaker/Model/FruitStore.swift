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
    
    let inventory: [Fruit: Int] = Fruit.allCases.reduce([Fruit: Int]()) { bag, crop in
        var bag = bag
        bag[crop] = initialNumberOfFruits
        return bag
    }
    
    enum InventoryManagementError: Error {
        case outOfStock
    }
}
