//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func blendFruitJuice(fruitJuice: JuiceType) {
        var isEnoughStock: Bool = true
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.checkFruitStock(fruit: $0.key , amount: $0.value)
        }
        
        guard isEnoughStock else {
            print("재고 부족으로 \(fruitJuice)를 만들 수 없습니다.")
            return
        }
        
        fruitJuice.recipe.forEach {
            fruitStore.reduceFruitCount(at: $0.key, with: $0.value)
        }
        print("주문하신 \(fruitJuice)가 나왔습니다.")
    }
}
      
