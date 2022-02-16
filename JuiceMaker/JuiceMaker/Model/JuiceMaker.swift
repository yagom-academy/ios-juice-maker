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
    
    mutating func make(with recipe: RecipeProtocol) -> Result<Void, Error> {
        let result = fruitStore.use(of: recipe.items)
        switch result {
        case .success():
            return .success(Void())
        case .failure(let error):
            return .failure(error)
        }
    }
}
