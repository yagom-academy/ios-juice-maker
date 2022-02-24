//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        do {
            _ = try fruitStore.isMakeReady(for: juice)
                subtractFruitQuantity(for: juice)
                print("주문하신 \(juice)가 나왔어용~")
            } catch (let fruit) {
                print("\(fruit)의 재고가 불충분합니다.")
        }
    }
    
    private func subtractFruitQuantity(for juice: Juice) {
        switch juice {
        case .strawberry:
            fruitStore.changeFruitQuantity(by: .strawberry, count: juice.recipe[.strawberry] ?? 0)
        case .banana:
            fruitStore.changeFruitQuantity(by: .banana, count: juice.recipe[.banana] ?? 0)
        case .pineapple:
            fruitStore.changeFruitQuantity(by: .pineapple, count: juice.recipe[.pineapple] ?? 0)
        case .kiwi:
            fruitStore.changeFruitQuantity(by: .kiwi, count: juice.recipe[.kiwi] ?? 0)
        case .mango:
            fruitStore.changeFruitQuantity(by: .mango, count: juice.recipe[.mango] ?? 0)
        case .strawberryBanana:
            fruitStore.changeFruitQuantity(by: .strawberry, count: juice.recipe[.strawberry] ?? 0)
            fruitStore.changeFruitQuantity(by: .banana, count: juice.recipe[.banana] ?? 0)
        case .mangoKiwi:
            fruitStore.changeFruitQuantity(by: .mango, count: juice.recipe[.mango] ?? 0)
            fruitStore.changeFruitQuantity(by: .kiwi, count: juice.recipe[.kiwi] ?? 0)
        }
    }
}
