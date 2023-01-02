//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func addOne(selectedFruit: String) throws {
        guard var number = fruits[selectedFruit] else {
            throw ErrorMessage.outOfRange
        }
        number += 1
        fruits[selectedFruit] = number
    }
    
    func minusOne(selectedFruit: String) throws {
        guard var number = fruits[selectedFruit] else {
            throw ErrorMessage.outOfRange
        }
        number -= 1
        fruits[selectedFruit] = number
    }
    
    func addError(selectedFruit: String) {
        do {
            try addOne(selectedFruit: selectedFruit)
        } catch ErrorMessage.outOfRange {
            print(ErrorMessage.outOfRange.rawValue)
        } catch {
            print("unknown error")
        }
    }
    
    func minusError(selectedFruit: String) {
        do {
            try minusOne(selectedFruit: selectedFruit)
        } catch ErrorMessage.outOfRange {
            print(ErrorMessage.outOfRange.rawValue)
        } catch {
            print("unknown error")
        }
    }
}

