//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum InitialSetting {
        static let stock = 10
    }
    
    var fruitDictionary: Dictionary<String, Int> = [Fruit.strawberry.name : InitialSetting.stock, Fruit.banana.name : InitialSetting.stock, Fruit.pineapple.name : InitialSetting.stock, Fruit.kiwi.name : InitialSetting.stock, Fruit.mango.name : InitialSetting.stock]
    
    func changeStock(fruit: String, stock: Int) {
        fruitDictionary[fruit] = stock
    }
    
    func addStock(fruit: String, stock: Int) throws {
        guard fruitDictionary.keys.contains(fruit) else {
            throw StockError.invalidSelection
        }
        
        guard let fruitStock = fruitDictionary[fruit] else {
            throw StockError.invalidSelection }
        let changedStock = fruitStock + stock
        
        fruitDictionary[fruit] = changedStock
    }
    
    func reduceStock(fruit: String, stock: Int) throws {
        guard let fruitStock = fruitDictionary[fruit] else {
            throw StockError.invalidSelection }
        
        guard fruitStock >= stock else {
            throw StockError.outOfStock
        }
        let changedStock = fruitStock - stock
        
        fruitDictionary[fruit] = changedStock
    }
}
