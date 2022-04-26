//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func chooseRecipe(of juice: Juice){
        do {
            try fruitStore.orderJuice(order: juice)
        } catch StockError.outOfError {
            print("재고부족")
        } catch {
            print(error)
        }
    }
}
