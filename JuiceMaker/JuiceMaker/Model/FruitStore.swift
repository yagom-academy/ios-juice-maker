//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private let storedStrawberry: Fruit = Fruit(name: .strawberry, quantity: 10)
    private let storedBanana: Fruit = Fruit(name: .banana, quantity: 10)
    private let storedKiwi: Fruit = Fruit(name: .kiwi, quantity: 10)
    private let storedPineapple: Fruit = Fruit(name: .pineapple, quantity: 10)
    private let storedMango: Fruit = Fruit(name: .mango, quantity: 10)
    
    private func searchFruit(of fruitName: Fruit.Name) -> Fruit {
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

    func check(requiredIngredient: Fruit) -> Bool {
        var isSatisfy: Bool
        
        if searchFruit(of: requiredIngredient.name).quantity < requiredIngredient.quantity {
            isSatisfy = false
        } else {
            isSatisfy = true
        }
        
        return isSatisfy
    }
    
    func bring(requiredIngredients: Fruit) -> Bool {
        var isSuccess: Bool
        let storedFruit: Fruit = searchFruit(of: requiredIngredients.name)
        
        guard check(requiredIngredient: requiredIngredients) else {
            isSuccess = false
            return isSuccess
        }
        
        storedFruit.changeQuantity(to: storedFruit.quantity - requiredIngredients.quantity)
        isSuccess = true
        
        return isSuccess
    }
    
    func updateQuantity(to requiredChange: Fruit) -> Bool {
        var isSuccess: Bool
        let storedFruit: Fruit = searchFruit(of: requiredChange.name)
        
        storedFruit.changeQuantity(to: requiredChange.quantity)

        if storedFruit.quantity >= 0 {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
}
