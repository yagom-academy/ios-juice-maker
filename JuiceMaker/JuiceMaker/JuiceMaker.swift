//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: UInt, CaseIterable {
    case strawberry = 0
    case banana = 1
    case kiwi = 2
    case pineapple = 3
    case strawberrybanana = 4
    case mango = 5
    case mangokiwi = 6
}

enum JuiceMakerError: Error {
    case juiceRecipeNotFound
    case wrongRecipe
    case insufficientFruit
}

struct JuiceMaker {
    private(set) var fruitManager: FruitManager
    private let recipes: [Juice: [Fruit: UInt]]
    
    init(fruitManager: FruitManager, recipes: [Juice: [Fruit: UInt]]) {
        self.fruitManager = fruitManager
        self.recipes = recipes
    }
    
    /**
    과일 쥬스를 제조하는 함수 (입력된 쥬스의 레시피대로 재고를 감소시키는 함수)
    
     - Parameter juice: 제조할 쥬스 종류
     - Throws:
        - 입력된 쥬스의 레시피가 존재하지 않을 경우 'JuiceMakerError.juiceRecipeNotFound'
        - 쥬스의 레시피에 포함된 과일이 저장소에 존재하지 않을 경우(레시피에 잘못된 과일이 포함) 'JuiceMakerError.wrongRecipe'
        - 과일 재고가 모자랄 경우 'JuiceMakerError.insufficientFruit'
    */
    mutating func make(juice: Juice) throws {
        guard let recipe = recipes[juice] else {
            throw JuiceMakerError.juiceRecipeNotFound
        }
        
        for (fruit, requiredCount) in recipe {
            guard let currentCount = fruitManager.fruitStore[fruit] else {
                throw JuiceMakerError.wrongRecipe
            }
            
            if currentCount < requiredCount {
                throw JuiceMakerError.insufficientFruit
            }
        }
        
        for (fruit, requiredCount) in recipe {
            do {
                try self.fruitManager.subtract(fruit: fruit, count: requiredCount)
            } catch {
                print("\(fruit) 재고를 빼는 과정에서 문제가 발생했습니다.")
            }
        }
    }
}
