//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberrybanana
    case mango
    case mangokiwi
}

enum FruitManagerError: Error {
    case fruitNotFound
    case impossibleToSubtract
}

enum JuiceMakerError: Error {
    case juiceRecipeNotFound
    case wrongRecipe
    case insufficientFruit
}

class FruitManager {
    private(set) var fruitStore: [Fruit: UInt]
    
    init(fruitsStore: [Fruit: UInt]) {
        self.fruitStore = fruitsStore
    }
    
    /**
    과일의 개수를 증가시키는 함수
    
     - Parameters:
         - fruit: 증가 시킬 과일 종류
         - count: 증가 시킬 과일 개수
     - Throws: 입력된 과일이 저장소에 존재하지 않을 경우 'FruitManagerError.fruitNotFound'
    */
    func add(fruit: Fruit, count: UInt) throws {
        guard let currentCount = self.fruitStore[fruit] else {
            throw FruitManagerError.fruitNotFound
        }
        
        self.fruitStore[fruit] = currentCount + count
    }
    
    /**
    과일의 개수를 감소시키는 함수
    
     - Parameters:
         - fruit: 감소 시킬 과일 종류
         - count: 감소 시킬 과일 개수
     - Throws:
        - 입력된 과일이 저장소에 존재하지 않을 경우 'FruitManagerError.fruitNotFound'
        - 현재 과일 개수보다 많은 개수가 입력으로 들어올 경우 'FruitManagerError.impossibleToSubtract'
    */
    func subtract(fruit: Fruit, count: UInt) throws {
        guard let currentCount = self.fruitStore[fruit] else {
            throw FruitManagerError.fruitNotFound
        }
        
        guard count <= currentCount else {
            throw FruitManagerError.impossibleToSubtract
        }
        
        self.fruitStore[fruit] = currentCount - count
    }
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
