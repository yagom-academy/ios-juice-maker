//
//  FruitManager.swift
//  JuiceMaker
//
//  Created by 임성민 on 2020/11/25.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum FruitManagerError: Error {
    case fruitNotFound
    case impossibleToSubtract
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
