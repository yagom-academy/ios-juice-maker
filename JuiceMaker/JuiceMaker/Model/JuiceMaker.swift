//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func manufactorJuice(menu: Juice) {
        guard filterError(juice: menu) else {
            return
        }
        
        fruitStore.substractFruits(juice: menu)
    }
    
    func checkStock(juice: Juice) throws -> Bool {
        for fruit in juice.recipe {
            guard let stock =  fruitStore.fruitStock[fruit.name], stock > fruit.count else {
                throw JuiceMakerError.outOfStock
            }
        }
        return true
    }
    
    func filterError(juice: Juice) -> Bool {
        do {
            let isNotSoldOut = try checkStock(juice: juice)
            return isNotSoldOut
        } catch JuiceMakerError.outOfStock {
            print("품절입니다.")
            return false
        } catch {
            print("some error")
            return false
        }
    }
}
