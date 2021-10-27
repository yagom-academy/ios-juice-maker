//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func fetchStock() -> [Fruit.Name: Int] {
        return fruitStore.fetchStock()
    }
    
    func make(_ juice: JuiceMenu) -> Bool {
        var successPoint: Int = 0
        
        for juice in juice.ingredients {
            successPoint = fruitStore.checkStock(for: juice) ? successPoint + 1 : successPoint
        }
        
        if successPoint != juice.ingredients.count {
            return false
        }
        
        for juice in juice.ingredients {
            fruitStore.useIngredients(of: juice)
        }
        
        return true
    }
    
    func updateStore(to requiredChange: Fruit) -> Bool {
        guard fruitStore.updateQuantity(to: requiredChange) else {
            print(Message.updateFailMessage.description)
            return false
        }

        return true
    }
    
}

