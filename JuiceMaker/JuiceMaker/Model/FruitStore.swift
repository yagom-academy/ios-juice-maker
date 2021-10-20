//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum FruitStoreError: Error {
    case outOfStock(_ fruitNeeded: [Fruit: Int])
    case noFruitExist
}

class FruitStore {
    static let initialFruitsQuantity: Int = 10
    var inventory: [Fruit: Int] = initializeInventory()
    
    static func initializeInventory() -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = FruitStore.initialFruitsQuantity
        }
        
        return inventory
    }
    
    func updateInventory(of recipe: [Fruit: Int]) throws {
        let calculatedInventory = self.inventory.merging(recipe) { (currentFruitQuantity, recipeFruitQuantity) in currentFruitQuantity - recipeFruitQuantity }
        
        guard self.inventory.count == calculatedInventory.count else {
            throw FruitStoreError.noFruitExist
        }
        
        let neededFruits = calculatedInventory.filter { (mergedQuantity) in mergedQuantity.value < 0 }
        guard neededFruits.count == 0 else {
            throw FruitStoreError.outOfStock(neededFruits)
        }
        
        self.inventory = calculatedInventory
    }
        
    func convertToString(using fruits: [Fruit: Int]) -> String {
        var resultString = ""
        for (fruit, quantity) in fruits {
            resultString += "과일 : \(fruit), 개수 : \(abs(quantity))\n"
        }
        
        return resultString
    }
}


