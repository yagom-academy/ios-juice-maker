//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    
    mutating func make(_ juice: Juice) -> Juice? {
        
        do {
            try FruitStore.shared.checkStock(with: juice.recipe)
            juice.recipe.forEach { key, value in
                FruitStore.shared.changeStock(with: key, value)
            }
            return juice
        } catch FruitStoreError.outOfStock {
            print(FruitStoreError.outOfStock.localized)
            return nil
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
