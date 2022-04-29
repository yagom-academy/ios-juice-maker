//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    typealias FruitsInventory = [Fruit: Int]
    private var fruitsInventory: FruitsInventory = [:]
    
    init(initialInventory:Int = 10) {
        Fruit.allCases.forEach { fruitsInventory[$0] = initialInventory }
    }
    
    func reduceInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            guard var inventory = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 사용전 재고: \(inventory)")
            inventory -= amountOfIngredient
            fruitsInventory[fruit] = inventory
            print("\(fruit) 사용후 재고: \(inventory)")
        }
    }
    
    func supplyInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfSupply = ingredient[fruit] ?? 0
            guard var inventory = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 입고전 재고: \(inventory)")
            inventory += amountOfSupply
            fruitsInventory[fruit] = inventory
            print("\(fruit) 입고후 재고: \(inventory)")
        }
    }
    
    func hasEnoughInventory(of ingredient: FruitsInventory, in inventory: FruitsInventory) throws -> Bool {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            let fruitInventory = inventory[fruit] ?? 0
            
            if fruitInventory >= requiredIngredient {
                continue
            } else {
                throw AppError.lackOfInventory
            }
        }
        return true
    }
}
