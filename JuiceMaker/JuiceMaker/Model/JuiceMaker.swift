//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func makeJuice(with recipe: Recipe) {
        let fruitStore: FruitStore = FruitStore()
        var fruits: [Fruit] = []
        var fruitsQuantity: [Int] = []
        
        switch recipe {
        case .strawberryJuice(strawberry: let quantity):
            fruits.append(fruitStore.strawberry)
            fruitsQuantity.append(quantity)
        case .bananaJuice(banana: let quantity):
            fruits.append(fruitStore.banana)
            fruitsQuantity.append(quantity)
        case .kiwiJuice(kiwi: let quantity):
            fruits.append(fruitStore.kiwi)
            fruitsQuantity.append(quantity)
        case .pineappleJuice(pineapple: let quantity):
            fruits.append(fruitStore.pineapple)
            fruitsQuantity.append(quantity)
        case .strawberryBananaJuice(let strawberryQuantity, let bananaQuantity):
            fruits.append(contentsOf: [fruitStore.strawberry, fruitStore.banana])
            fruitsQuantity.append(contentsOf: [strawberryQuantity, bananaQuantity])
        case .mangoJuice(mango: let quantity):
            fruits.append(fruitStore.mango)
            fruitsQuantity.append(quantity)
        case .mangoKiwiJuice(let mangoQuantity, let kiwiQuantity):
            fruits.append(contentsOf: [fruitStore.mango, fruitStore.kiwi])
            fruitsQuantity.append(contentsOf: [mangoQuantity, kiwiQuantity])
        }
        
        do {
            try fruitStore.changeStock(of: fruits, by: fruitsQuantity)
        } catch FruitStoreError.shortageOfStock(let fruit) {
            print("\(fruit.name)의 재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
}
