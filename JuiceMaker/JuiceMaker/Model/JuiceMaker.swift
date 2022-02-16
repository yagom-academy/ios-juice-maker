//
//  JuiceMaker - JuiceMaker.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case 딸기쥬스
    case 바나나쥬스
    case 키위쥬스
    case 파인애플쥬스
    case 딸바쥬스
    case 망고쥬스
    case 망고키위쥬스
}

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> String {
        switch juice {
        case .딸기쥬스:
            return validateMakeJuice(fruits: [(Fruit.딸기, -16)])
        case .바나나쥬스:
            return validateMakeJuice(fruits: [(Fruit.바나나, -2)])
        case .키위쥬스:
            return validateMakeJuice(fruits: [(Fruit.키위, -3)])
        case .파인애플쥬스:
            return validateMakeJuice(fruits: [(Fruit.파인애플, -2)])
        case .딸바쥬스:
            return validateMakeJuice(fruits: [(Fruit.딸기, -10), (Fruit.바나나, -1)])
        case .망고쥬스:
            return validateMakeJuice(fruits: [(Fruit.망고, -3)])
        case .망고키위쥬스:
            return validateMakeJuice(fruits: [(Fruit.망고, -2), (Fruit.키위, -1)])
        }
    }
    
    private func validateMakeJuice(fruits: [(Fruit, Int)]) -> String {
        do {
            try fruitStore.changeAmountOfFruit(fruits: fruits)
            return "성공"
        } catch let error as FruitError {
            return error.description
        } catch {
            return error.localizedDescription
        }
    }
}
