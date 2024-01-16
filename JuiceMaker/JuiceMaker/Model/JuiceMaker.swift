//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(menuNumber: Menu) {
        switch menuNumber {
        case .strawberryJuice: // 딸기
            fruitStore.changeCount(fruit: .strawberry, usedCount: 16)
        case .bananaJuice: // 바나나
            fruitStore.changeCount(fruit: .banana, usedCount: 2)
        case .kiwiJuice: // 키위
            fruitStore.changeCount(fruit: .kiwi, usedCount: 3)
        case .pineappleJuice: // 파인애플
            fruitStore.changeCount(fruit: .pineapple, usedCount: 2)
        case .strawberryBananaJuice: // 딸바
            fruitStore.changeCount(fruit: .strawberry, usedCount: 10)
            fruitStore.changeCount(fruit: .banana, usedCount: 1)
        case .mangoJuice: // 망고
            fruitStore.changeCount(fruit: .mango, usedCount: 3)
        case .mangoKiwiJuice: // 망고키위
            fruitStore.changeCount(fruit: .mango, usedCount: 2)
            fruitStore.changeCount(fruit: .kiwi, usedCount: 1)
        }
    }
}
