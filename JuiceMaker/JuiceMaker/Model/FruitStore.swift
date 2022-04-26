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
    
    var fruitDictionary: Dictionary<String, Int> = [Fruit.strawberry.rawValue : InitialSetting.stock, Fruit.banana.rawValue : InitialSetting.stock, Fruit.pineapple.rawValue : InitialSetting.stock, Fruit.kiwi.rawValue : InitialSetting.stock, Fruit.mango.rawValue : InitialSetting.stock]
    
    func changeStock(fruit: String, stock: Int) {
        fruitDictionary[fruit] = stock
    }
    
    func addStock(fruit: String, stock: Int) throws {
        guard fruitDictionary.keys.contains(fruit) else {
            throw stockError.invalidSelection
        }
        
        guard let fruitStock = fruitDictionary[fruit] else {
            return }
        let changedStock = fruitStock + stock
        
        fruitDictionary[fruit] = changedStock
    }
    
    func reduceStock(fruit: String, stock: Int) throws {
        guard let fruitStock = fruitDictionary[fruit] else {
            throw stockError.invalidSelection }
        
        guard fruitStock >= stock else {
            throw stockError.invalidSelection
        }
        let changedStock = fruitStock - stock
 
        fruitDictionary[fruit] = changedStock
    }
}
