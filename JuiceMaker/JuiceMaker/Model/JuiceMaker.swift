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
        
        do {
            switch recipe {
            case .strawberryJuice(strawberry: let quantity):
                try fruitStore.changeStock(of: fruitStore.strawberry, by: quantity)
            case .bananaJuice(banana: let quantity):
                try fruitStore.changeStock(of: fruitStore.banana, by: quantity)
            case .kiwiJuice(kiwi: let quantity):
                try fruitStore.changeStock(of: fruitStore.kiwi, by: quantity)
            case .pineappleJuice(pineapple: let quantity):
                try fruitStore.changeStock(of: fruitStore.pineapple, by: quantity)
            case .strawberryBananaJuice(let strawberryQuantity, let bananaQuantity):
                try fruitStore.changeStock(of: fruitStore.strawberry, fruitStore.banana,
                                           by: strawberryQuantity, bananaQuantity)
            case .mangoJuice(mango: let quantity):
                try fruitStore.changeStock(of: fruitStore.mango, by: quantity)
            case .mangoKiwiJuice(let mangoQuantity, let kiwiQuantity):
                try fruitStore.changeStock(of: fruitStore.mango, fruitStore.kiwi,
                                           by: mangoQuantity, kiwiQuantity)
            }
        } catch FruitStoreError.shortageOfStock(let fruit) {
            print("\(fruit.name)의 재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
}
