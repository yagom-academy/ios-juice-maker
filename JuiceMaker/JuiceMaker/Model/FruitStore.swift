//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    let storedStrawberry: Fruit = Fruit(name: .strawberry, quantity: 10)
    let storedBanana: Fruit = Fruit(name: .banana, quantity: 10)
    let storedKiwi: Fruit = Fruit(name: .kiwi, quantity: 10)
    let storedPineapple: Fruit = Fruit(name: .pineapple, quantity: 10)
    let storedMango: Fruit = Fruit(name: .mango, quantity: 10)
    
    func searchStorage(of fruitName: Fruit.FruitName) -> Fruit {
        switch fruitName {
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

    func checkQuantity(_ requiredIngredient: Fruit) -> Bool {
        var isSatisfy: Bool
        let storedFruit = searchStorage(of: requiredIngredient.name)
        
        if storedFruit.quantity < requiredIngredient.quantity {
            isSatisfy = false
        } else {
            isSatisfy = true
        }
        
        return isSatisfy
    }
    
    func bringIngredients(_ requiredIngredients: Fruit) -> Bool {
        var isSuccess: Bool
        let storedFruit: Fruit = searchStorage(of: requiredIngredients.name)
        
        storedFruit.quantity = storedFruit.quantity - requiredIngredients.quantity
        
        if storedFruit.quantity >= 0 {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
    
    func updateQuantity(to requiredChange: Fruit) -> Bool {
        var isSuccess: Bool
        let storedFruit: Fruit = searchStorage(of: requiredChange.name)
        
        storedFruit.quantity = storedFruit.quantity + requiredChange.quantity
        
        if storedFruit.quantity >= 0 {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
}
