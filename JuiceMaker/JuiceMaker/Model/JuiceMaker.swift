//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func makeJuice(juice: Juice, fruitStock: [Fruit: Int])  {
        do {
            switch juice {
            case .strawberryJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .strawberry, amount: 16))
            case .bananaJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .banana, amount: 2))
            case .kiwiJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .kiwi, amount: 3))
            case .pineappleJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .pineapple, amount: 2))
            case .strawberryBananaJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .strawberry, amount: 10), (fruit: .banana, amount: 1))
            case .mangoJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .mango, amount: 3))
            case .mangoKiwiJuice:
                try fruitStore.useValidStock(usedFruits: (fruit: .mango, amount: 2), (fruit: .kiwi, amount: 1))
            }
        } catch FruitStoreError.notFoundKey(let fruit) {
            print("\(fruit)을 찾을 수 없습니다.")
        } catch FruitStoreError.notEnoughStock(let fruit) {
            print("\(fruit) 재고가 없습니다.")
        } catch {
            print("알 수 없는 에러")
        }
    }
}
