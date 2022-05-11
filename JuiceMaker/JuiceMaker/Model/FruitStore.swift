//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    // MARK: - Enum
    
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    // MARK: - Properties
    
    typealias FruitsInventory = [Fruit: Int]
    private(set) var fruitsInventory: FruitsInventory = [:]
    
    init(initialInventory: Int = 10) {
        Fruit.allCases.forEach { fruitsInventory[$0] = initialInventory }
    }
    
    // MARK: - Action
    
    func reduceInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            
            guard var inventory = fruitsInventory[fruit] else {
                throw AppError.invalidInputOfFruit
            }
            
            inventory -= amountOfIngredient
            fruitsInventory[fruit] = inventory
        }
    }
    
    func applyChangesToFruitsInventory(from changedInventory: FruitsInventory) {
        for fruitName in changedInventory.keys {
            let newQuantity = changedInventory[fruitName] ?? 0
            fruitsInventory[fruitName] = newQuantity
        }
    }
    
    func isInventoryEnough(for ingredient: FruitsInventory) -> Bool {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            let fruitInventory = self.fruitsInventory[fruit] ?? 0
            
            if fruitInventory < requiredIngredient {
                return false
            }
        }
        
        return true
    }
}
