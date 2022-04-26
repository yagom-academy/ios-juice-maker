//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitDictionary: Dictionary<String, Int> = [Fruit.strawberry.name : InitialFruitSetting.stock, Fruit.banana.name : InitialFruitSetting.stock, Fruit.pineapple.name : InitialFruitSetting.stock, Fruit.kiwi.name : InitialFruitSetting.stock, Fruit.mango.name : InitialFruitSetting.stock]
    
    func changeStock(fruit: String, amount: Int) {
        fruitDictionary[fruit] = amount
    }
    
    func addStock(fruit: String, amount: Int) throws {
        guard fruitDictionary.keys.contains(fruit) else {
            throw StockError.invalidSelection
        }
        
        guard let fruitStock = fruitDictionary[fruit] else {
            throw StockError.invalidSelection }
        let changedStock = fruitStock + amount
        
        fruitDictionary[fruit] = changedStock
    }
    
    func reduceStock(fruit: String, amount: Int) throws {
        guard let fruitStock = fruitDictionary[fruit] else {
            throw StockError.invalidSelection }
        
        guard fruitStock >= amount else {
            throw StockError.outOfStock
        }
        let changedStock = fruitStock - amount
        
        fruitDictionary[fruit] = changedStock
    }
}
