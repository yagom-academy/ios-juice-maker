//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: String, CaseIterable, CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
    
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

enum FruitStoreError: Error {
    case outOfStock(_ fruitNeeded: [Fruit: Int])
}

class FruitStore {
    var inventory: [Fruit: Int]
    
    init(quantity: Int = 10) {
        self.inventory = FruitStore.initializeInventory(quantity: quantity)
    }
    
    static func initializeInventory(quantity: Int) -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = quantity
        }
        
        return inventory
    }
    
    func updateInventory(of recipe: [Fruit: Int]) throws {
        let calculatedInventory = self.inventory.merging(recipe) { (currentFruitQuantity, recipeFruitQuantity) in currentFruitQuantity - recipeFruitQuantity }
        
        try checkOutOfStock(calculatedInventory)
        
        self.inventory = calculatedInventory
    }
        
    func checkOutOfStock(_ calculatedInventory: [Fruit: Int]) throws {
        let neededFruits = calculatedInventory.filter { (mergedQuantity) in mergedQuantity.value < 0 }
        
        guard neededFruits.count == 0 else {
            throw FruitStoreError.outOfStock(neededFruits)
        }
    }
    
    func convertToString(using fruits: [Fruit: Int]) -> String {
        var resultString = ""
        
        for (fruit, quantity) in fruits {
            resultString += "과일 : \(fruit), 개수 : \(abs(quantity))\n"
        }
        
        return resultString
    }

}
