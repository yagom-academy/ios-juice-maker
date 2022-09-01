//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(_ juice: Juice) {
        do {
            try fruitStore.checkStockOfIngredients(in: juice.recipe)
            for ingredient in juice.recipe {
                fruitStore.changeStock(of: ingredient.fruit, by: -ingredient.amount)
            }
        } catch FruitStoreError.notInFruitList {
            print(FruitStoreError.notInFruitList.failureReason)
        } catch FruitStoreError.outOfStock {
            print(FruitStoreError.outOfStock.failureReason)
        } catch {
            print(error)
        }
    }
}
