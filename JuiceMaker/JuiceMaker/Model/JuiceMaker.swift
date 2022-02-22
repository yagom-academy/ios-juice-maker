//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(checkJuice: Juice) {
        do {
            try fruitStore.function1(recipe: checkJuice.recipe)
            fruitStore.function2(recipe: checkJuice.recipe)
        } catch JuiceMakerError.outOfStock {
            print("재고가 없습니다")
        } catch {
            print("알 수 없는 오류입니다")
        }
    }
}
