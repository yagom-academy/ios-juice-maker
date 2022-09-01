//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func manufactorJuice(orderJuice: Juice) {
        guard canManufactorJuice(juice: orderJuice) else {
            return
        }
        
        fruitStore.substractFruits(juice: orderJuice)
    }
    
    func checkEnoughStock(juice: Juice) throws -> Bool {
        for fruit in juice.recipe {
            guard let stock = fruitStore.bringFruitStock(fruit.name), stock >= fruit.count else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        return true
    }
    
    func canManufactorJuice(juice: Juice) -> Bool {
        var isEnoughStock: Bool = false
        
        do {
            isEnoughStock = try checkEnoughStock(juice: juice)
            return isEnoughStock
        } catch JuiceMakerError.outOfStock {
            print("과일 재고 품절입니다.")
            return isEnoughStock
        } catch {
            print("some error")
            return isEnoughStock
        }
    }
}
