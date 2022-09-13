//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func manufactureJuice(menu juice: Juice) -> Bool {
        guard canManufactureJuice(juice: juice) else {
            return false
        }
        
        fruitStore.substractFruits(juice: juice)
        return true
    }
    
    private func checkEnoughStock(juice: Juice) throws -> Bool {
        for fruit in juice.recipe {
            let stock = fruitStore.bringValidFruitStock(fruit.name)
            guard stock != ConstantUsageFruit.invalidFruit else {
                return false
            }
            
            guard stock >= fruit.count else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        return true
    }
    
    private func canManufactureJuice(juice: Juice) -> Bool {
        var isEnoughStock: Bool = false
        
        do {
            isEnoughStock = try checkEnoughStock(juice: juice)
            return isEnoughStock
        } catch JuiceMakerError.outOfStock {
            print("과일 재고 품절입니다.")
        } catch {
            print("some error")
        }
        
        return isEnoughStock
    }
    
    func passingChangedFruitStock(_ changedStock: [Fruit : Int]) {
        fruitStore.updateFruits(changedStock)
    }
}
