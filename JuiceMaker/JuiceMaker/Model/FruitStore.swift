//
//  JuiceMaker - FruitStore.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case 딸기
    case 바나나
    case 파인애플
    case 키위
    case 망고
}

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit: Int] = [.딸기: 10, .바나나: 10, .파인애플: 10, .키위: 10, .망고: 10]
    
    func changeAmountOfFruit(amount: Int, fruit: Fruit) -> Bool {
        guard let fruitAmount = store[fruit] else { return false }
        
        if fruitAmount + amount < 0 { return false }
        
        store[fruit] = fruitAmount + amount
        return true
    }
}
