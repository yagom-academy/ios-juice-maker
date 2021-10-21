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
    private var stock: [Fruit: Int]
    
    init(quantity: Int = 10) {
        self.stock = FruitStore.initializeInventory(quantity: quantity)
    }
    
    private static func initializeInventory(quantity: Int) -> [Fruit: Int] {
        var inventory: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            inventory[key] = quantity
        }
        
        return inventory
    }
    
    func updateStock(of recipe: [Fruit: Int]) throws {
        let calculatedStock = self.stock.merging(recipe) { (currentFruitQuantity, recipeFruitQuantity) in currentFruitQuantity - recipeFruitQuantity }
        
        try checkOutOfStock(calculatedStock)
        
        self.stock = calculatedStock
    }
    
    func add(fruit: Fruit, quantity: Int = 1) {
        if let fruitCount = stock[fruit] {
            stock.updateValue(fruitCount + quantity, forKey: fruit)
        }
    }
        
    private func checkOutOfStock(_ calculatedStock: [Fruit: Int]) throws {
        let neededFruits = calculatedStock.filter { (mergedQuantity) in mergedQuantity.value < 0 }
        
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
