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
    var fruitsInventory: FruitsInventory = [:]
    
    init() {
        let initialInventory = 10
        Fruit.allCases.forEach { eachFruit in fruitsInventory[eachFruit] = initialInventory }
    }
    
    func reduceInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            guard var stock = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 사용전 재고: \(stock)")
            stock -= amountOfIngredient
            print("\(fruit) 사용후 재고: \(stock)")
        }
    }
    
    func supplyInventory(of ingredient: FruitsInventory) throws {
        for fruit in ingredient.keys {
            let amountOfSupply = ingredient[fruit] ?? 0
            guard var stock = fruitsInventory[fruit] else { throw AppError.invalidInputOfFruit }
            
            print("\(fruit) 입고전 재고: \(stock)")
            stock += amountOfSupply
            print("\(fruit) 입고후 재고: \(stock)")
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
