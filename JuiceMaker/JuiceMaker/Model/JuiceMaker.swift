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
        guard requestFruitStock(menu: fruitJuice) else {
            print("\(fruitJuice) 재료가 부족합니다ㅠㅠ")
            return
        }
        
        receiveFruitStock(menu: fruitJuice)
        
        print("주문하신 \(fruitJuice)가 나왔습니다.")
    }
    
    func requestFruitStock(menu fruitJuice: JuiceType) -> Bool {
        var isEnoughStock: Bool = Bool()
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.checkStock(fruit: $0.key, amount: $0.value)
        }
        
        return isEnoughStock
    }
    
    func receiveFruitStock(menu fruitJuice: JuiceType) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
    }
}
      
