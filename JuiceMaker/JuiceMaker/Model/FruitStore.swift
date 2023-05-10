//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    
    
    var requiredFruitQuantity: RequiredFruitQuantity = RequiredFruitQuantity()
    
    private func increase(_ fruit: Fruit, _ stock: Int) {
        self.stock[fruit, default: 0] += stock
    }
    
    private func decrease(_ fruit: Fruit, _ stock: Int) {
        self.stock[fruit, default: 0] -= stock
    }
    
    
    func checkFruitStock(_ juice: Juice) -> Bool {
        let recipe: [Fruit: Int] = juice.recipe
        
        let stock = recipe.filter { (key, value)  in
            if let stockCompare = self.stock[key], value <= stockCompare {
                return true
            }
            return false
        }
        
        if stock.count != recipe.count {
            return false
        } else {
            return true
        }
    }
    
    func checkFruitStock2(_ juice: Juice) throws -> Bool {
        let recipe: [Fruit: Int] = juice.recipe
        var stockCheck: Bool = false
        
        for (key, value) in recipe {
            if let stock = self.stock[key], value <= stock {
                stockCheck = true
            } else {
                stockCheck = false
                break
            }
        }
        return stockCheck
    }
    
//    func checkFruitStock2(_ juice: Juice) throws -> Bool {
//        var recipe: [Fruit: Int] = juice.recipe
//        var stockCheck: Bool = false
//
//        recipe.forEach { (key: Fruit, value: Int) in
//            if let stock = self.stock[key], value <= stock {
//                stockCheck = true
//            } else {
//                stockCheck = false
//            }
//        }
//        return stockCheck
//    }
}

