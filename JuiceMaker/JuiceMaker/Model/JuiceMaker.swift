//
//  JuiceMaker - JuiceMaker.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(juice:Juice) -> Bool {
        switch juice {
        case .딸기쥬스:
            return fruitStore.changeAmountOfFruit(amount: -16, fruit: .딸기)
        case .바나나쥬스:
            return fruitStore.changeAmountOfFruit(amount: -2, fruit: .바나나)
        case .키위쥬스:
            return fruitStore.changeAmountOfFruit(amount: -3, fruit: .키위)
        case .파인애플쥬스:
            return fruitStore.changeAmountOfFruit(amount: -2, fruit: .파인애플)
        case .딸바쥬스:
            return fruitStore.changeAmountOfFruit(amount: -10, fruit: .딸기) &&
            fruitStore.changeAmountOfFruit(amount: -1, fruit: .바나나)
        case .망고쥬스:
            return fruitStore.changeAmountOfFruit(amount: -3, fruit: .망고)
        case .망고키위쥬스:
            return fruitStore.changeAmountOfFruit(amount: -2, fruit: .망고) &&
            fruitStore.changeAmountOfFruit(amount: -1, fruit: .키위)
        }
    }
}

enum Juice {
    case 딸기쥬스
    case 바나나쥬스
    case 키위쥬스
    case 파인애플쥬스
    case 딸바쥬스
    case 망고쥬스
    case 망고키위쥬스
}
