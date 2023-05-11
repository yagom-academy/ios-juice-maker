//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

enum JuiceMakerError: Error {
    case outOfFruitStock(menu: JuiceType)
}

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func blendFruitJuice(menu fruitJuice: JuiceType) throws {
        guard requestFruitStock(menu: fruitJuice) else {
            throw JuiceMakerError.outOfFruitStock(menu: fruitJuice)
        }
        
        receiveFruitStock(menu: fruitJuice)
        
        print("주문하신 \(fruitJuice)가 나왔습니다.")
    }
    
    private func requestFruitStock(menu fruitJuice: JuiceType) -> Bool {
        var isEnoughStock: Bool = Bool()
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.checkStock(fruit: $0.key, amount: $0.value)
        }
        
        return isEnoughStock
    }
    
    private func receiveFruitStock(menu fruitJuice: JuiceType) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
    }
}
      
