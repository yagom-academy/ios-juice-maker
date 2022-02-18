//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitStoreError: String, Error {
    case notEnoughFruit = "과일이 부족합니다."
}

// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init() {
        self.initFruitStore()
    }
    
    private func initFruitStore(initCount: Int = 10) {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = initCount
        }
    }
    
    private func reduce(of needFruit: FruitInfo) {
        if let storeFruitQuntity = stock[needFruit.fruit]  {
            stock[needFruit.fruit] = storeFruitQuntity - needFruit.count
        }
    }
    
    private func checkEnough(for needFruit: FruitInfo) throws {
        guard let storeFruitQuntity = stock[needFruit.fruit], storeFruitQuntity >= needFruit.count else {
            throw FruitStoreError.notEnoughFruit
        }
    }
    
    func useFruit(of juice: Juice) throws {
        for needFruit in juice.recipe.fruitList {
            try checkEnough(for: needFruit)
        }
        for needFruit in juice.recipe.fruitList {
            reduce(of: needFruit)
        }
    }
}
