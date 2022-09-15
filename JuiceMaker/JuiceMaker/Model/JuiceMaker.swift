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
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        do {
            try fruitStore.checkStockOfIngredients(in: juice.recipe)
            for ingredient in juice.recipe {
                fruitStore.changeStock(of: ingredient.fruit, by: -ingredient.amount)
            }
        } catch FruitStoreError.notInInventoryFruitList {
            return .failure(.notInInventoryFruitList)
        } catch FruitStoreError.outOfStock {
            return .failure(.outOfStock)
        } catch {
            return .failure(.unexpectedError)
        }
        return .success(juice)
    }
}
