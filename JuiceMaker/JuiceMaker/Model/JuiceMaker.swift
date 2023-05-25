//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    
    func make(_ juice: Juice) -> Juice? {
        do {
            try FruitStore.shared.checkStock(with: juice.recipe)
            juice.recipe.forEach { fruit, stock in
                FruitStore.shared.changeStock(with: fruit, -stock)
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
