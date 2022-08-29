//
//  JuiceMaker - JuiceMaker.swift
//  Created by stone, jpush.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        switch juice {
        case .strawberry:
            validFruitCount(fruit: .strawberry, by: 16)
        case .banana:
            validFruitCount(fruit: .banana, by: 2)
        case .kiwi:
            validFruitCount(fruit: .kiwi, by: 3)
        case .pineapple:
            validFruitCount(fruit: .pineapple, by: 2)
        case .strawberryBanana:
            validFruitCount(fruit: .strawberry, by: 10)
            validFruitCount(fruit: .banana, by: 1)
        case .mango:
            validFruitCount(fruit: .mango, by: 3)
        case .mangoKiwi:
            validFruitCount(fruit: .mango, by: 2)
            validFruitCount(fruit: .kiwi, by: 1)
        }
    }
    
    func validFruitCount(fruit: Fruit, by count: Int) -> Bool {
        guard let fruitCount = fruitStore.fetchFruitCount(fruit: fruit) else {
            return false
        }
        
        return fruitCount >= count ? true : false
    }
}
