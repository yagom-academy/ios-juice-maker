//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum Message {
        static let outOfStock = "재료가 모자라요. 재고를 수정할까요?"
        static let nonZeroStock = "재고를 0미만으로 설정 할 수 없습니다"
        
        static func completeMakingJuice(on juice: Juice) -> String {
            "\(juice) 나왔습니다! 맛있게 드세요!"
        }
    }
    
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) throws {
        let juiceRecipes = juice.recipe
        
        for juiceRecipe in juiceRecipes {
            guard try fruitStore.hasEnoughStock(of: juiceRecipe) else {
                throw JuiceMakerError.outOfStock
            }
        }
        try fruitStore.useStocks(with: juiceRecipes)
    }
    
    func getFruitStore() -> FruitStore {
        return fruitStore
    }
}
