//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 과일 저장소 에러 
enum FruitStoreError: String, Error {
    case notEnoughFruit
}

/// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init() {
        self.initFruitStore()
    }
    
    /// 과일의 개수를 10으로 초기화한다.
    private func initFruitStore(initCount: Int = 10) {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = initCount
        }
    }
    
    /// 과일을 소진한다.
    private func reduce(of needFruit: FruitInfo) {
        if let storeFruitQuntity = stock[needFruit.fruit]  {
            stock[needFruit.fruit] = storeFruitQuntity - needFruit.quantity
        }
    }
    
    /// 사용해야할 과일이 매장재고에 있는지 검사한다.
    func checkEnough(for needFruit: FruitInfo) throws {
        guard let storeFruitQuntity = stock[needFruit.fruit], storeFruitQuntity >= needFruit.quantity else {
            throw FruitStoreError.notEnoughFruit
        }
    }
    
    /// 레시피의 과일을 사용한다.
    func useFruit(of juice: Juice) throws {
        for needFruit in juice.recipe.fruitList {
            try checkEnough(for: needFruit)
        }
        for needFruit in juice.recipe.fruitList {
            reduce(of: needFruit)
        }
    }
    
    /// 과일의 개수를 가져온다.
    func quantity(of fruit: Fruit) -> Int {
        return stock[fruit] ?? 0
    }
    
    func updateQuantity(of fruit: Fruit, quantity: Int) {
        stock[fruit] = quantity
    }
}
