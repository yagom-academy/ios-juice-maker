//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> Result<Juice, FruitStoreError> {
        do {
            try self.fruitStore.useValidStock(juiceRecipe: juice.recipe)
            return .success(juice)
        } catch FruitStoreError.notEnoughStock(let fruit) {
            return .failure(FruitStoreError.notEnoughStock(fruit))
        } catch {
            return .failure(FruitStoreError.unknown)
        }
    }
    
    func getStock(fruit: Fruit) -> Int {
        return fruitStore.getStock(fruit: fruit)
    }
}
