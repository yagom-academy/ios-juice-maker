//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore: FruitStore

    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }

    func makeJuice(juice: Juice) {
        // 쥬스를 만드는데 필요한 재고 확인
        let juiceRecipes = juice.recipe // [(Fruit.strawberry, 16)]
        
        // 재료에 대한 재고가 충분한지 검증하는 로직.
        for juiceRecipe in juiceRecipes {
            // 현재 보유한 쥬스의 재고 확인
            let fruit = juiceRecipe.fruitName
            let needCount = juiceRecipe.count
            
            guard let stock = fruitStore.fruitStocks[fruit], stock > needCount else {
                
                return
            }
        }
        
        // 재료에 대한 재고가 충분하므로, 쥬스 재료에 대한 재고 차감
        fruitStore.useStocks(with: juiceRecipes)
        
        // 주문완료 알럿 로직 예정.
    }
}
