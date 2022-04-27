//
//  JuiceMaker - FruitStore.swift
//  Created by 수꿍, 바드.
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
     private var fruitRecipe: Dictionary<Fruit, Int> = [
        Fruit.strawberry: InitialFruitSetting.stock,
        Fruit.banana: InitialFruitSetting.stock,
        Fruit.pineapple: InitialFruitSetting.stock,
        Fruit.kiwi: InitialFruitSetting.stock,
        Fruit.mango: InitialFruitSetting.stock
    ]
    
    func changeStock(fruit: Fruit, amount: Int) throws {
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        
        fruitRecipe[fruit] = amount
    }
    
    func addStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw JuiceMakerError.missingProduct
        }
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        let changedStock = fruitStock + amount
        
        fruitRecipe[fruit] = changedStock
    }
    
    func reduceStock(fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitRecipe[fruit] else {
            throw JuiceMakerError.missingProduct
        }
        guard amount >= 0 else {
            throw JuiceMakerError.invalidAmount
        }
        guard fruitStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        let changedStock = fruitStock - amount
        
        fruitRecipe[fruit] = changedStock
    }
}
