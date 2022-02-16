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
    case outOfStock
    case nonExistentFruit
}

extension FruitError: LocalizedError {
    var description: String {
        switch self {
        case .nonExistentFruit:
            return "과일이 존재하지 않습니다."
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit: Int] = Fruit.allCases.reduce(into: [:]) { store, fruit in
        store[fruit] = 10
    }
    
    func changeAmountOfFruit(fruits: [Recipe]) throws {
        var temporaryResult: [Recipe] = []
        
        try fruits.forEach {
            guard let fruitStock = store[$0.fruit] else {
                throw FruitError.nonExistentFruit
            }
            
            if fruitStock + $0.amount < 0 {
                throw FruitError.outOfStock
            }
            
            let recipe = Recipe(fruit: $0.fruit, amount: $0.amount + fruitStock)
            temporaryResult.append(recipe)
        }
        
        if temporaryResult.count == fruits.count {
            updateFruit(fruits: temporaryResult)
        }
    }
    
    private func updateFruit(fruits: [Recipe]) {
        fruits.forEach {
            store[$0.fruit] = $0.amount
        }
    }
}
