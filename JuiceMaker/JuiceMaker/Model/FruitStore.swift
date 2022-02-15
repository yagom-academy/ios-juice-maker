//
//  JuiceMaker - FruitStore.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitName {
    case 딸기
    case 바나나
    case 파인애플
    case 키위
    case 망고
}

struct Fruit {
    let name: FruitName
    var amount: Int = 10
}

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit] = [Fruit(name: .딸기),
                          Fruit(name: .바나나),
                          Fruit(name: .파인애플),
                          Fruit(name: .키위),
                          Fruit(name: .망고)
                        ]
    
    func changeAmountOfFruit(amount: Int, fruit: Fruit) {
        guard let fruitIndex = findCertainIndex(in: store, fruit: fruit) else {
            return
        }
        
        store[fruitIndex].amount += amount
    }
    
    private func findCertainIndex(in store: [Fruit], fruit: Fruit) -> Int? {
        guard let index = store.firstIndex(where: { $0.name == fruit.name } ) else {
            return nil
        }
        
        return index
    }
}
