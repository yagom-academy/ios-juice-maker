//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

protocol JuiceMakerType {
    func make(_ juice: Juice)
    func count(of fruit: Fruit) -> Int
}

/// 쥬스 메이커 타입
struct JuiceMaker: JuiceMakerType {
    private let fruitStore : FruitStoreType

    init(fruitStore: FruitStoreType = FruitStore()) {
        self.fruitStore = fruitStore
    }

    func make(_ juice: Juice) {
        fruitStore.consume(ingredients: juice.ingredients)
    }

    func count(of fruit: Fruit) -> Int {
        return fruitStore.count(of: fruit)
    }
}
