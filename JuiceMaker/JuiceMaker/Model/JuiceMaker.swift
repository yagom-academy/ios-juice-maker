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
            try checkAbout(fruitJuice)
        } catch JuiceMakerError.outOfStock {
            print("재고없음")
        } catch {
            print("알수없는 오류")
        }
    }
    
    func checkAbout(_ fruitJuice: FruitJuice) throws {
        for (fruit, count) in fruitJuice.getRecipe() {
            try fruitStore.checkGenerationAvailable(fruit: fruit, count: count)
        }
    }
}
