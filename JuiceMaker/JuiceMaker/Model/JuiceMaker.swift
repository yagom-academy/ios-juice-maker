//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore()) {
        self.fruitStore = fruitStore
    }

    mutating func make(with recipe: JuiceProtocol) -> Result<JuiceProtocol, Error> {
        return fruitStore.use(of: recipe.items)
            .map{ _ in recipe }
            .mapError { $0 }
    }
}
