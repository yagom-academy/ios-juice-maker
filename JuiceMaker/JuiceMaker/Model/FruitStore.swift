//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

import Foundation

enum Fruit {
    case strawberry, banana, kiwi, mango, pineapple
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        case .pineapple:
            return "파인애플"
        }
    }
}

enum JuiceError: Error {
    case lackedInventory
}

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10]
    
    func increaseFruit(fruit: Fruit, number: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit + number
    }
    
    func decreaseFruit(fruit: Fruit, number: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit - number
    }
    
    func checkFruit(fruit: Fruit, number: Int) throws -> Bool {
        guard let storedFruit = self.fruits[fruit] else {
            return false
        }
        guard storedFruit >= number else {
            throw JuiceError.lackedInventory
        }
        
        return true
    }
}
