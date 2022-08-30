//
//  JuiceMaker - FruitStore.swift
//  Created by som, LJ. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stack: [Fruit: Int] = [:]
    
    init(defaultStack: Int) {
        Fruit.allCases.forEach { stack[$0] = defaultStack }
    }
    
    func changeFruitStock(fruit: Fruit, amount: Int) throws {
        guard let countFruit = stack[fruit] else {
            throw OrderError.unknown
        }
        
        if countFruit - amount < 0 {
            throw OrderError.outOfStack
        }
        
        stack[fruit] = countFruit - amount
        print(stack)
        print("쥬스 만들기 성공!")
    }
}
