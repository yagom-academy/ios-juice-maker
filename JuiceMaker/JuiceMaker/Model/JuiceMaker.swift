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
    
    func makeJuice(of juice: Juice) {
        do {
            try fruitStore.checkStockOfFruits(in: juice.recipe)
            for material in juice.recipe {
                fruitStore.changeStock(of: material.fruit, amount: -material.amount)
            }
        } catch FruitStoreError.wrongAmount {
            print(FruitStoreError.wrongAmount.failureReason)
        } catch FruitStoreError.notInFruitList {
            print(FruitStoreError.notInFruitList.failureReason)
        } catch FruitStoreError.outOfStock {
            print(FruitStoreError.outOfStock.failureReason)
        } catch {
            print(error)
        }
    }
}
