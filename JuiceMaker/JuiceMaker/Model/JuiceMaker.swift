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
    
    func makeJuice(_ juice: Juice) throws {
        switch juice {
        case .strawberryJuice:
            guard self.fruitStore.fruits[.strawberry, default: 0] > 16 else {
                throw JuiceMakerError.outOfStock
            }
            self.fruitStore.decrease(fruit: .strawberry, to: 16)
        case .bananaJuice:
            break
        case .kiwiJuice:
            break
        case .pineappleJuice:
            break
        case .mangoJuice:
            break
        case .strawberryBananaJuice:
            break
        case .mangoKiwiJuice:
            break
        }
    }
    
}

//딸기쥬스 : 딸기 16개 소모
//바나나쥬스 : 바나나 2개 소모
//키위쥬스 : 키위 3개 소모
//파인애플 쥬스 : 파인애플 2개 소모
//딸바쥬스 : 딸기 10개 + 바나나 1개 소모
//망고 쥬스 : 망고 3개 소모
//망고키위 쥬스 : 망고 2개 + 키위 1개 소모
