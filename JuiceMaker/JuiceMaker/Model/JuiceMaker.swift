//
//  JuiceMaker - JuiceMaker.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
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
