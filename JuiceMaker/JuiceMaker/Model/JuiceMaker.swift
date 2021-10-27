//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func fetchAllStock() -> [Fruit.Name: Int] {
        return fruitStore.fetchAllStock()
    }
    
    func make(_ juice: JuiceMenu) -> Bool {
        var validStockToMake = 0
        
        for juice in juice.ingredients {
            validStockToMake = fruitStore.checkStock(for: juice) ? validStockToMake + 1 : validStockToMake + 0
        }
        
        if validStockToMake != juice.ingredients.count {
            return false
        }
        
        for juice in juice.ingredients {
            fruitStore.consumeStock(of: juice)
        }
        
        return true
    }
    
    func updateStock(to requiredChange: Fruit) -> Bool {
        guard fruitStore.updateStock(to: requiredChange) else {
            print(AlertMessage.updateFailMessage.description)
            return false
        }

        return true
    }
    
}

