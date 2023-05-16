//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfFruitStock
    case unknownError
    
    var description: String {
        switch self {
        case .outOfFruitStock:
            return "재고가 부족하여 음료 제조가 불가능 합니다."
        case .unknownError:
            return "알 수 없는 오류"
        }
    }
}

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore(initialStock: 10)
    
    func blendFruitJuice(menu fruitJuice: Juice) throws {
        try requestFruitStock(menu: fruitJuice)
        receiveFruitStock(menu: fruitJuice)
    }
    
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = true
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value) && isEnoughStock
        }
        
        if isEnoughStock == false {
            throw JuiceMakerError.outOfFruitStock
        }
    }
    
    private func receiveFruitStock(menu fruitJuice: Juice) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
    }
}
      
