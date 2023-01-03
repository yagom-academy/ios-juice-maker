//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func addOne(selectedFruit: String) -> Result<Int, ErrorMessage> {
        guard var number = fruits[selectedFruit] else {
            return .failure(.outOfRange)
        }
        number += 1
        return .success(number)
    }
    
    func minusOne(selectedFruit: String) -> Result<Int, ErrorMessage> {
        guard var number = fruits[selectedFruit] else {
            return .failure(.outOfRange)
        }
        number -= 1
        return .success(number)
    }
    
    func add(selectedFruit: String) {
        let add = addOne(selectedFruit: selectedFruit)
        switch add {
        case .success(let number):
            fruits[selectedFruit] = number
        case .failure(let error):
            print(error.rawValue)
        }
    }
    
    func minus(selectedFruit: String) {
        let minus = minusOne(selectedFruit: selectedFruit)
        switch minus {
        case .success(let number):
            fruits[selectedFruit] = number
        case .failure(let error):
            print(error.rawValue)
        }
    }
    
    func isStocked(selectedFruit: String) -> Bool {
        guard let fruitStock = fruits[selectedFruit] else {
            return false
        }
        if fruitStock >= 0 {
            return true
        } else {
            return false
        }
    }
}

