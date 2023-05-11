//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func blendFruitJuice(menu fruitJuice: JuiceType) {
        var isEnoughStock: Bool = true
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.checkStock(fruit: $0.key, amount: $0.value)
        }
        
        guard isEnoughStock else {
            print("재고 부족으로 \(fruitJuice)를 만들 수 없습니다.")
            return
        }
        
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
        print("주문하신 \(fruitJuice)가 나왔습니다.")
    }
}
      
