//
//  JuiceMaker - FruitStore.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case 딸기
    case 바나나
    case 파인애플
    case 키위
    case 망고
}

enum FruitError: String, Error {
    case outOfAmount
    case noFruit
}

extension FruitError: LocalizedError {
    var description: String {
        switch self {
        case .noFruit:
            return "과일이 존재하지 않습니다."
        case .outOfAmount:
            return "재고가 부족합니다."
        }
    }
}

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit: Int] = [.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    func changeAmountOfFruit(fruits: [(Fruit, Int)]) throws {
        var temporaryResult: [(Fruit, Int)] = []
        
        try fruits.forEach { (fruit, amount) in
            guard let fruitAmount = store[fruit] else { throw FruitError.noFruit }
            if fruitAmount + amount < 0 { throw FruitError.outOfAmount }
            temporaryResult.append((fruit, fruitAmount + amount))
        }
        
        if temporaryResult.count == fruits.count {
            updateFruit(fruits: temporaryResult)
        }
    }
    
    private func updateFruit(fruits: [(Fruit, Int)]) {
        fruits.forEach { (fruit, amount) in
            store[fruit] = amount
        }
    }
}
