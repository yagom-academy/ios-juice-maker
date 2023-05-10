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
    
    
    func checkFruitStock(_ juice: Juice) throws -> Bool {
        let recipe: [Fruit: Int] = juice.recipe
        
        let filterRecipe = recipe.filter{ (key, value) -> Bool in
            if let stockCompare = self.stock[key], value < stockCompare {
                return true
            }
            return false
        }
        return
    }
}

var aa: [Fruit: [Int]] = [:]
