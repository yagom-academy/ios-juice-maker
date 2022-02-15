//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    private let stock: [Fruit: Int]
    
    init() {
        let allFruits = Fruit.allCases
        stock = allFruits.reduce(into: [:], { partialResult, fruit in
            partialResult[fruit] = 10
        })
    }
    
    func getStock(of fruit: Fruit) -> Int {
        return stock[fruit] ?? 0
    }
    
}
