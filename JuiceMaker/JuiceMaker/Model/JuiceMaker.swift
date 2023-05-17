//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore()) {
        self.fruitStore = fruitStore
    }
    
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
    
    func setDelegate<T: FruitStoreDelegate>(delegator: T) {
        fruitStore.delegate = delegator
    }
}
