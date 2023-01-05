//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    static let shared = FruitStore(initialStockNumber: 10)
    
    private init(initialStockNumber: Int) {
        fruitsBasket = fruitsBasket.mapValues { $0 + initialStockNumber }
    }
    
    private var fruitsBasket : [Fruit: Int] = [.strawberry: 0, .banana: 0, .pineapple: 0, .kiwi: 0, .mango: 0]

    
    func addOne(of fruit: Fruit) {
        if let currentFruitCount = fruitsBasket[fruit] {
            let addedFruitCount = currentFruitCount + 1
            fruitsBasket[fruit] = addedFruitCount
        }
    }
    
    func reduceOne(of fruit: Fruit) {
        guard let currentFruitCount = fruitsBasket[fruit],
              currentFruitCount >= 0 else {
            return
        }
        let reducedFruitCount = currentFruitCount - 1
        fruitsBasket[fruit] = reducedFruitCount
    }
    
    func checkFruit(name: Fruit, count: Int) -> Bool {
        if let currentFruitCount = fruitsBasket[name] {
            return currentFruitCount >= count ? true : false
        }
        return false
    }
    
    func reduceStock(of fruit: Fruit, count: Int) {
        if let currentFruitCount = fruitsBasket[fruit] {
            let reducedCount = (currentFruitCount - count)
            fruitsBasket[fruit] = reducedCount
        }
    }
}
