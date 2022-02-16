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
    case nonExistentFruit
}

extension FruitError: LocalizedError {
    var description: String {
        switch self {
        case .nonExistentFruit:
            return "과일이 존재하지 않습니다."
        case .outOfAmount:
            return "재고가 부족합니다."
        }
    }
}

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit: Int] = Fruit.allCases.reduce(into: [:]) { store, fruit in
        store[fruit] = 10
    }
    
    func changeAmountOfFruit(fruits: [(Fruit, Int)]) throws {
        var temporaryResult: [(Fruit, Int)] = []
        
        try fruits.forEach { (fruit, amount) in
            guard let fruitAmount = store[fruit] else { throw FruitError.nonExistentFruit }
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
