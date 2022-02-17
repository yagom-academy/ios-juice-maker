//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) throws -> String {
        do {
            try fruitStore.useFruit(fruits: juice.ingredient)
            return "쥬스 제조 후 \(juice.name) 쥬스 나왔습니다! 맛있게 드세요!"
        } catch {
            throw error
        }
    }
}
