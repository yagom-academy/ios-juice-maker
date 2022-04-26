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

    var fruitDictionary: Dictionary<Fruit, Int> = [.strawberry : InitialSetting.stock, .banana : InitialSetting.stock, .pineapple : InitialSetting.stock, .kiwi : InitialSetting.stock, .mango : InitialSetting.stock]
    
    func changeStock(fruit: Fruit, stock: Int) {
        fruitDictionary[fruit] = stock
    }
    
    func addStock(fruit: Fruit, stock: Int) {
        guard let fruitStock = fruitDictionary[fruit] else { return }
        let changedStock = fruitStock + stock
        
        fruitDictionary[fruit] = changedStock
    }
    
    func reduceStock(fruit: Fruit, stock: Int) {
        guard let fruitStock = fruitDictionary[fruit] else { return }
        let changedStock = fruitStock - stock
        
        if fruitStock < stock {
            print("재고가 부족합니다.")
        } else {
            fruitDictionary[fruit] = changedStock
        }
    }
}
