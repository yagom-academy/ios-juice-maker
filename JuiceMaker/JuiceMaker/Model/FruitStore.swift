//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

class FruitStore {
    private let storedStrawberry: Fruit = Fruit(name: .strawberry, quantity: 10)
    private let storedBanana: Fruit = Fruit(name: .banana, quantity: 10)
    private let storedKiwi: Fruit = Fruit(name: .kiwi, quantity: 10)
    private let storedPineapple: Fruit = Fruit(name: .pineapple, quantity: 10)
    private let storedMango: Fruit = Fruit(name: .mango, quantity: 10)
    
    private var stock: [Fruit]
    
    init() {
        stock = [storedStrawberry, storedBanana, storedKiwi, storedPineapple, storedMango]
    }
    
    func fetchAllStock() -> [Fruit.Name: Int] {
        var fruitStoreInventory = [Fruit.Name: Int]()
        
        for fruit in Fruit.Name.allCases {
            fruitStoreInventory.updateValue(fetchStoredFruit(of: fruit).quantity,
                                            forKey: fetchStoredFruit(of: fruit).name)
        }

        return fruitStoreInventory
    }
    
    private func fetchStoredFruit(of fruitName: Fruit.Name) -> Fruit {
        stock.filter{$0.name == fruitName}[0]
    }
    
    func checkStock(for requiredIngredient: Fruit) -> Bool {
        fetchStoredFruit(of: requiredIngredient.name).quantity >= requiredIngredient.quantity
    }
    
    func consumeStock(of requiredIngredients: Fruit) {
        let storedFruit: Fruit = fetchStoredFruit(of: requiredIngredients.name)
        let afterComsumeStock = storedFruit.quantity - requiredIngredients.quantity
        
        storedFruit.changeQuantity(to: afterComsumeStock)
    }
    
    func updateStock(to requiredChange: Fruit) -> Bool {
        let storedFruit: Fruit = fetchStoredFruit(of: requiredChange.name)
        
        storedFruit.changeQuantity(to: requiredChange.quantity)

        return storedFruit.quantity >= 0
    }
}
