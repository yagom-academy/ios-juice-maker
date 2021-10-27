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
    
    func fetchAllStock() -> [Fruit.Name: Int] {
        var fruitStoreInventory = [Fruit.Name: Int]()
        
        for fruit in Fruit.Name.allCases {
            fruitStoreInventory.updateValue(returnStoredFruit(of: fruit).quantity,
                                            forKey: returnStoredFruit(of: fruit).name)
        }

        return fruitStoreInventory
    }
    
    private func returnStoredFruit(of fruitName: Fruit.Name) -> Fruit {
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
    
    func checkStock(for requiredIngredient: Fruit) -> Bool {
        returnStoredFruit(of: requiredIngredient.name).quantity < requiredIngredient.quantity ? false : true
    }
    
    func consumeIngredients(of requiredIngredients: Fruit) {
        let storedFruit: Fruit = returnStoredFruit(of: requiredIngredients.name)
        
        storedFruit.changeQuantity(to: storedFruit.quantity - requiredIngredients.quantity)
    }
    
    func updateQuantity(to requiredChange: Fruit) -> Bool {
        let storedFruit: Fruit = returnStoredFruit(of: requiredChange.name)
        
        storedFruit.changeQuantity(to: requiredChange.quantity)

        if storedFruit.quantity >= 0 {
            return true
        } else {
            return false
        }
    }
}
