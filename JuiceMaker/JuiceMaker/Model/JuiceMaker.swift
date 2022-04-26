//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var JuiceMakersStore = FruitStore()

    func makeJuice(juice: Juice) {
        switch juice {
        case .strawberryJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, stock: 16)
        case .bananaJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, stock: 2)
        case .kiwiJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, stock: 3)
        case .pineappleJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.pineapple.name, stock: 2)
        case .strawberryBananaJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.strawberry.name, stock: 10)
            try? JuiceMakersStore.reduceStock(fruit: Fruit.banana.name, stock: 1)
        case .mangoJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, stock: 3)
        case .mangoKiwiJuice:
            try? JuiceMakersStore.reduceStock(fruit: Fruit.mango.name, stock: 2)
            try? JuiceMakersStore.reduceStock(fruit: Fruit.kiwi.name, stock: 1)
        }
    }
}
