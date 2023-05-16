//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) -> Result<Juice, FruitStoreError> {
        do {
            try self.fruitStore.useValidStock(juiceRecipe: juice.recipe)
            return .success(juice)
        } catch FruitStoreError.notFoundFruit(let fruit) {
            return .failure(FruitStoreError.notFoundFruit(fruit))
        } catch FruitStoreError.notEnoughStock(let fruit) {
            return .failure(FruitStoreError.notEnoughStock(fruit))
        } catch {
            return .failure(FruitStoreError.unknown)
        }
    }
}
