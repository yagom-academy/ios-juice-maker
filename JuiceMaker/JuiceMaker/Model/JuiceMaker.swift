//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(select juiceMenu: JuiceMenu) {
        let receipe = juiceMenu.receipe
        
        do {
            for (fruit, stock) in receipe {
                try fruitStore.subtractStock(fruit: fruit, amount: stock)
                fruitStore.printStock(fruit: fruit)
            }
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
