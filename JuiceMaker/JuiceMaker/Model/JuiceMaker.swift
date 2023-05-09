//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice, fruitStock: [FruitStore.Fruit: Int])  {
        do {
            switch juice {
            case .strawberryJuice:
                try fruitStore.checkStock(fruit: .strawberry, by: 16)
            case .bananaJuice:
                try fruitStore.checkStock(fruit: .banana, by: 2)
            case .kiwiJuice:
                try fruitStore.checkStock(fruit: .kiwi, by: 3)
            case .pineappleJuice:
                try fruitStore.checkStock(fruit: .pineapple, by: 2)
            case .strawberryBananaJuice:
                try fruitStore.checkStock(fruit: .strawberry, by: 10)
                try fruitStore.checkStock(fruit: .banana, by: 1)
            case .mangoJuice:
                try fruitStore.checkStock(fruit: .mango, by: 3)
            case .mangoKiwiJuice:
                try fruitStore.checkStock(fruit: .mango, by: 2)
                try fruitStore.checkStock(fruit: .kiwi, by: 1)
            }
        } catch FruitStoreError.notFoundKey {
            print("과일을 찾을 수 없습니다.")
        } catch FruitStoreError.notEnoughStock(let fruit) {
            print("\(fruit) 재고가 없습니다.")
        } catch {
            print("알 수 없는 에러")
        }
    } 
}
