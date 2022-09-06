//
//  JuiceMaker - JuiceMaker.swift
//  Created by Mene, Dragon. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let store = FruitStore(initialFruitAmount: 10)
    
    func makeJuice(of juice: Juice) -> Bool {
        let recipe = juice.recipe
        
        for (fruit, _) in recipe {
            guard let fruitStock = store.inventory[fruit] else { return false }
            guard let fruitRequiredNumber = recipe[fruit] else { return false }
            
            if fruitStock < fruitRequiredNumber {
                print("재고가 부족합니다.")
                return false
            }
        }
        
        for (fruit, _) in recipe {
            guard let fruitStock = store.inventory[fruit] else { return false }
            guard let fruitRequiredNumber = recipe[fruit] else { return false }

            store.inventory[fruit] = fruitStock - fruitRequiredNumber
        }
        
        print("\(juice.rawValue) 쥬스를 만듭니다.")
        return true
    }
    
    func checkStock(of fruit: Fruit) -> String? {
        guard let fruitStock = store.inventory[fruit] else { return nil }
        debugPrint("\(fruit)의 남은 개수는 \(fruitStock)")
        return String(fruitStock)
    }
}
