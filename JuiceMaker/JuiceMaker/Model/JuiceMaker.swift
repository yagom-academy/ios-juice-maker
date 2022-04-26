//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(_ fruitJuice: FruitJuice) {
        do {
            try checkAbout(fruitJuice)
        } catch JuiceMakerError.outOfStock {
            print("재고없음")
        } catch {
            print("알수없는 오류")
        }
    }
    
    
    func checkAbout(_ fruitJuice: FruitJuice) throws {
        switch fruitJuice {
        case .strawberryJuice:
            try fruitStore.checkGenerationAvailable(fruit: .strawberry, count: 16)
        case .bananaJuice:
            try fruitStore.checkGenerationAvailable(fruit: .banana, count: 2)
        case .kiwiJuice:
            try fruitStore.checkGenerationAvailable(fruit: .kiwi, count: 3)
        case .pineappleJuice:
            try fruitStore.checkGenerationAvailable(fruit: .pineapple, count: 2)
        case .mangoJuice:
            try fruitStore.checkGenerationAvailable(fruit: .mango, count: 3)
        case .strawberryAndBananaJuice:
            try fruitStore.checkGenerationAvailable(fruit: .strawberry, count: 10)
            try fruitStore.checkGenerationAvailable(fruit: .banana, count: 1)
        case .mangoAndKiwiJuice:
            try fruitStore.checkGenerationAvailable(fruit: .mango, count: 2)
            try fruitStore.checkGenerationAvailable(fruit: .kiwi, count: 1)
        }
    }
}
