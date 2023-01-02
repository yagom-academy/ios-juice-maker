//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

import Foundation

enum Fruit {
    case strawberry, banana, kiwi, mango, pineapple
}

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10]
    
    func increaseFruit(fruit: Fruit, number: Int) {
        guard let self.fruits[fruit] else {
            return
        }
    }
    
    func decreaseFruit(number: Int) {
        
    }
}
