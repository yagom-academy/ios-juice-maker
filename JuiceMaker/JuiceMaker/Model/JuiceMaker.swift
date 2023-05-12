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
    
    private func canMake(_ juice: Juice) -> Result<Bool, FruitStoreError> {
        for (fruit, amount) in juice.recipe {
            guard fruitStore.checkStock(of: fruit, for: amount) else { return .failure(FruitStoreError.outOfStock) }
        }
        return .success(true)
    }
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        let result = canMake(juice)
        
        switch result {
        case .success(_):
            for (fruit, amount) in juice.recipe {
                fruitStore.changeStock(of: fruit, by: -amount)
            }
            return .success(juice)
        case .failure(let error):
            return .failure(error)
        }
    }
}
