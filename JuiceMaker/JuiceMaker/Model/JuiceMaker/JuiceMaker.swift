//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

protocol JuiceMakerable {
    /// 쥬스 제조 함수
    ///
    /// Parameters:
    ///   - juice : Juice 타입
    ///
    func make(of juice: Juice)
}

//MARK: 쥬스 메이커 타입
struct JuiceMaker: JuiceMakerable {
    let fruitStore = FruitStore()
    
    func make(of juice: Juice) {
        fruitStore.consume(fruits: juice.requireIngredients())
    }
}
