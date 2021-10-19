//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    let storedStrawberry: Fruit = Fruit(fruitName: .strawberry, count: 10)
    let storedBanana: Fruit = Fruit(fruitName: .banana, count: 10)
    let storedKiwi: Fruit = Fruit(fruitName: .kiwi, count: 10)
    let storedPineapple: Fruit = Fruit(fruitName: .pineapple, count: 10)
    let storedMango: Fruit = Fruit(fruitName: .mango, count: 10)
    
    func searchStorage(fruitNmae: Fruit.FruitName) -> Fruit {
        switch fruitNmae {
        case .strawberry:
            return storedStrawberry
        case .banana:
            return storedBanana
        case .kiwi:
            return storedKiwi
        case .pineapple:
            return storedPineapple
        case .mango:
            return storedMango
        }
    }

    func checkQuantity(requiredIngredient: Fruit) -> Bool {
        var isSatisfy: Bool
        let storedFruit = searchStorage(fruitNmae: requiredIngredient.name)
        
        if storedFruit.count < requiredIngredient.count {
            isSatisfy = false
        } else {
            isSatisfy = true
        }
        
        return isSatisfy
    }
    
    func bringIngredients(ingredients: Fruit) -> Bool {
        var isSuccess: Bool
        let storedFruit: Fruit = searchStorage(fruitNmae: ingredients.name)
        
        storedFruit.count = storedFruit.count - ingredients.count
        
        if storedFruit.count >= 0 {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
    
    func updateQuantity(changingFruit: Fruit) -> Bool {
        var isSuccess: Bool
        let changedFruit: Fruit = searchStorage(fruitNmae: changingFruit.name)
        
        changedFruit.count = changedFruit.count + changingFruit.count
        
        if changedFruit.count == changingFruit.count {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
}
