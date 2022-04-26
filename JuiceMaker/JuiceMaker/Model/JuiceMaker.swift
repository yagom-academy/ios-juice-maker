//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(_ fruitJuice: FruitJuice) {
        do {
            try checkGenerationAvailable(fruitJuice)
            generate(fruitJuice)
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
    
    func checkGenerationAvailable(_ fruitJuice: FruitJuice) throws {
        for (fruit, amount) in fruitJuice.getRecipe()  {
            try fruitStore.checkInventory(about: fruit, by: amount)
        }
    }
    
    func generate(_ fruitJuice: FruitJuice) {
        for (fruit, amount) in fruitJuice.getRecipe() {
            fruitStore.usedLeftover(fruit, by: amount)
        }
    }
}
