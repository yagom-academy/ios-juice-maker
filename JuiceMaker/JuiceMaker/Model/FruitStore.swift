//
//  JuiceMaker - FruitStore.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
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
    
    var store: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
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
