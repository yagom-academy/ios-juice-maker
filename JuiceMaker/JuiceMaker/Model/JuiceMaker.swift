//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore.shard
    private var recipe: [Fruit: Int] = [:]
    
    mutating func order(_ juice: Juice) -> Bool {
        self.recipe = juice.recipe
        
        do {
            try fruitStore.checkStock(with: self.recipe)
            fruitStore.changeStock(with: self.recipe)
            return true
        } catch FruitStoreError.outOfStock {
            print("재고가 부족합니다.")
            return false
        } catch {
            print(error)
            return false
        }
    }
    
    
    
  
    
}
