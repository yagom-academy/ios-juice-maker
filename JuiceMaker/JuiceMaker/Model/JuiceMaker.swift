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
        for material in juice.recipe {
            guard fruitStore.canSubtract(amount: material.amount, of: material.fruit) else {
                return
            }
        }
        for material in juice.recipe {
            do {
                try fruitStore.subtract(amount: material.amount, of: material.fruit)
            } catch FruitStoreError.wrongAmount {
                print(FruitStoreError.wrongAmount.failureReason)
            } catch FruitStoreError.notInFruitList {
                print(FruitStoreError.notInFruitList.failureReason)
            } catch {
                print(error)
            }
        }
    }
}
