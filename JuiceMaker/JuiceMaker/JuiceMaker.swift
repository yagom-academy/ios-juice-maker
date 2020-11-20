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
    case notFoundFruit
    case impossibleToSubtract
}

enum JuiceMakerError: Error {
    case notFoundJuiceRecipe
    case wrongRecipe
    case insufficientFruit
}

struct FruitManager {
    private(set) var fruitStore: [Fruit: UInt]
    
    init(fruitsStore: [Fruit: UInt]) {
        self.fruitStore = fruitsStore
    }
    
    /**
    과일의 개수를 증가시키는 함수
    
     - Parameters:
         - fruit: 증가 시킬 과일 종류
         - count: 증가 시킬 과일 개수
     - Throws: 입력된 과일이 저장소에 존재하지 않을 경우 'FruitManagerError.notFoundFruit'
    */
    mutating func add(fruit: Fruit, count: UInt) throws {
        guard let currentCount = self.fruitStore[fruit] else {
            throw FruitManagerError.notFoundFruit
        }
        
        self.fruitStore[fruit] = currentCount + count
    }
    
    /**
    과일의 개수를 감소시키는 함수
    
     - Parameters:
         - fruit: 감소 시킬 과일 종류
         - count: 감소 시킬 과일 개수
     - Throws:
        - 입력된 과일이 저장소에 존재하지 않을 경우 'FruitManagerError.notFoundFruit'
        - 현재 과일 개수보다 많은 개수가 입력으로 들어올 경우 'FruitManagerError.impossibleToSubtract'
    */
    mutating func subtract(fruit: Fruit, count: UInt) throws {
        guard let currentCount = self.fruitStore[fruit] else {
            throw FruitManagerError.notFoundFruit
        }
        
        guard count <= currentCount else {
            throw FruitManagerError.impossibleToSubtract
        }
        
        self.fruitStore[fruit] = currentCount - count
    }
}

struct JuiceMaker {
    var fruitManager = FruitManager(fruitsStore: [Fruit.strawberry: 10, Fruit.banana: 10, Fruit.pineapple: 10, Fruit.kiwi: 10, Fruit.mango: 10])
    
    let recipes: [Juice: [Fruit: UInt]] = [Juice.strawberry: [Fruit.strawberry: 16], Juice.banana: [Fruit.banana: 2], Juice.kiwi: [Fruit.kiwi: 3], Juice.pineapple: [Fruit.pineapple: 2], Juice.strawberrybanana: [Fruit.strawberry: 10, Fruit.banana: 1], Juice.mangokiwi: [Fruit.mango: 2, Fruit.kiwi: 1]]
    
    /**
    과일 쥬스를 제조하는 함수 (입력된 쥬스의 레시피대로 재고를 감소시키는 함수)
    
     - Parameter juice: 제조할 쥬스 종류
     - Throws:
        - 입력된 쥬스의 레시피가 존재하지 않을 경우 'JuiceMakerError.notFoundJuiceRecipe'
        - 쥬스의 레시피에 포함된 과일이 저장소에 존재하지 않을 경우(레시피에 잘못된 과일이 포함) 'JuiceMakerError.wrongRecipe'
        - 과일 재고가 모자랄 경우 'JuiceMakerError.insufficientFruit'
    */
    mutating func make(juice: Juice) throws {
        guard let recipe = recipes[juice] else {
            throw JuiceMakerError.notFoundJuiceRecipe
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
