//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 과일 저장소 에러 
enum FruitStoreError: String, Error {
    case notEnoughFruit = "과일이 부족합니다."
}

/// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init() {
        self.initFruitStore()
    }
    
    /// 과일의 개수를 10으로 초기화한다.
    func initFruitStore(initCount: Int = 10) {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = initCount
        }
    }
    
    /// 과일을 소진한다.
    private func reduce(of fruit: Fruit, count: Int) throws {
        guard let currentFruitCount = stock[fruit], currentFruitCount >= count else {
            throw FruitStoreError.notEnoughFruit
        }
        stock[fruit] = currentFruitCount - count
    }
    
    /// 레시피의 과일을 사용한다.
    func useFruit(of juice: Juice) throws {
        for fruitInfo in juice.recipe.fruitList {
            try reduce(of: fruitInfo.fruit, count: fruitInfo.count)
        }
    }
    
    /// 과일의 개수를 가져온다.
    func quantity(of fruit: Fruit) -> Int {
        return stock[fruit] ?? 0
    }
}
