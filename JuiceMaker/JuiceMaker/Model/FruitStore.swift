//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitDictionary: Dictionary<Fruit, Int> = [.strawberry : 10, .banana : 10, .pineapple : 10, .kiwi : 10, .mango : 10]
    
    func changeStock(fruit: Fruit, stock: Int) {
        fruitDictionary[fruit] = stock
    }
    
    func addStock(fruit: Fruit, stock: Int) {
        guard let fruitStock = fruitDictionary[fruit] else { return }
        
        fruitDictionary[fruit] = fruitStock + stock
    }
    
    func reduceStock(fruit: Fruit, stock: Int) {
        guard let fruitStock = fruitDictionary[fruit] else { return }
        
        if fruitStock < stock {
            print("재고가 부족합니다.")
        } else {
            fruitDictionary[fruit] = fruitStock - stock
        }
    }
}
